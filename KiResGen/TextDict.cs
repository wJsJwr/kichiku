using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KiResGen {
    /// <summary>
    /// 字符编码：最常用的128个字符占用一个字节，最高位为0，若一个字节的最高位为1，则代表是一个双字节的字。
    /// </summary>
    class TextDict {
        private List<TextItem> tis;
        private Dictionary<char, int> charDict;
        private Dictionary<char, string> fontDict;
        private Dictionary<char, string> smallFontDict;
        private Dictionary<char, ushort> charcodes;

        private const int FONT_SIZE = 14;

        public TextDict() {
            this.tis = new List<TextItem>();
            this.charDict = new Dictionary<char, int>();
            this.fontDict = new Dictionary<char, string>();
            this.charcodes = new Dictionary<char, ushort>();
            this.smallFontDict = new Dictionary<char, string>();
        }

        public void add(string line) {
            if (string.IsNullOrEmpty(line) || !line.Contains(',')) return;
            string[] col = line.Split(',');
            if (col.Length != 3) {
                throw new Exception("format not valid");
            } else {
                int no = int.Parse(col[0]);
                tis.Add(new TextItem(no, col[1], col[2]));
            }
        }

        /// <summary>
        /// use 16*16 bitmap font
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        private string charTobmp(char c,bool small=false) {
            List<byte> s = new List<byte>();
            if (small) {
                Bitmap bmp = new Bitmap(10, 10);
                Graphics g = Graphics.FromImage(bmp);
                //文泉驿点阵正黑
                Font f = new Font("Zfull-GB", 9.4f, FontStyle.Regular, GraphicsUnit.Pixel, (byte)134);
                g.TextRenderingHint = System.Drawing.Text.TextRenderingHint.ClearTypeGridFit;
                g.DrawString(c.ToString(), f, Brushes.Black, new RectangleF(-1, 0, 10, 10));
                for (int i = 0; i < 10; i++) {
                    for (int j = 0; j < 10; j++) {
                        if (bmp.GetPixel(i, j).ToArgb() == Color.Black.ToArgb()) {
                            s.Add((byte)(((i & 0xf) << 4) | (j & 0xf)));
                        }
                    }
                }
            } else {
                Bitmap bmp = new Bitmap(FONT_SIZE, FONT_SIZE);
                Graphics g = Graphics.FromImage(bmp);
                //文泉驿点阵正黑
                Font f = new Font("文泉驿点阵正黑", 12, FontStyle.Regular, GraphicsUnit.Pixel, (byte)134);
                //g.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAliasGridFit;
                if ("utriF".Contains(c)) {
                    g.DrawString(c.ToString(), f, Brushes.Black, new RectangleF(0, -2, FONT_SIZE, FONT_SIZE));

                } else {
                    g.DrawString(c.ToString(), f, Brushes.Black, new RectangleF(-1, -2, FONT_SIZE, FONT_SIZE));

                }
                for (int i = 0; i < FONT_SIZE; i++) {
                    for (int j = 0; j < FONT_SIZE; j++) {
                        if (bmp.GetPixel(i, j).ToArgb() == Color.Black.ToArgb()) {
                            s.Add((byte)(((i & 0xf) << 4) | (j & 0xf)));
                        }
                    }
                }
            }
            //Console.WriteLine("{0}:{1}", c, Core.toBase64(s.ToArray()));

            return Core.toBase64(s.ToArray());
        }

        

        public void translate() {
            this.charDict = new Dictionary<char, int>();
            this.fontDict = new Dictionary<char, string>();

            for (int i = 0; i < 10; i++) {
                char c = i.ToString()[0];
                charDict.Add(c, 10000);
                fontDict.Add(c, charTobmp(c));
                smallFontDict.Add(c, charTobmp(c, true));
            }
            foreach (char c in "，。！？/") {
                charDict.Add(c, 5000);
                fontDict.Add(c, charTobmp(c));
                smallFontDict.Add(c, charTobmp(c, true));
            }
            foreach (TextItem ti in this.tis) {
                foreach (char c in ti.srcText) {
                    if (charDict.ContainsKey(c)) {
                        charDict[c] += 1;
                    } else {
                        charDict.Add(c, 1);
                        fontDict.Add(c, charTobmp(c));
                        smallFontDict.Add(c, charTobmp(c, true));
                    }
                }
            }

            this.charcodes = new Dictionary<char, ushort>();
            // set 0-9 the most frequently used
            for (int i = 0; i < 10; i++) {
                this.charcodes.Add(i.ToString()[0], (ushort)i);
            }

            var cs = from i in charDict orderby i.Value descending select i.Key;

            ushort idx = 10;
            foreach (char c in cs) {
                if (!char.IsDigit(c)) {
                    this.charcodes.Add(c, idx);
                    idx += 1;
                    if (idx == 128) {
                        idx = 0x8000;
                    }
                }
            }

            for (int i = 0; i < this.tis.Count; i++) {
                List<byte> b = new List<byte>();
                for (int j = 0; j < tis[i].srcText.Length; j++) {
                    ushort v = this.charcodes[tis[i].srcText[j]];
                    if (v < 0x100) {
                        b.Add((byte)(v & 0xff));
                    } else {
                        b.Add((byte)((v >> 8) & 0xff));
                        b.Add((byte)(v & 0xff));
                    }
                }
                tis[i].transText = Core.toBase64(b.ToArray());
            }
            
        }

        public List<string> fontLib {
            get {
                List<string> f = new List<string>();
                foreach (KeyValuePair<char, ushort> i in charcodes) {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("[\"");
                    sb.Append(i.Value);
                    sb.Append("\",\"");
                    sb.Append(fontDict[i.Key]);
                    sb.Append("\"]");
                    f.Add(sb.ToString());
                }
                return f;
            }
        }

        public List<string> smallFontLib {
            get {
                List<string> f = new List<string>();
                foreach (KeyValuePair<char, ushort> i in charcodes) {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("[\"");
                    sb.Append(i.Value);
                    sb.Append("\",\"");
                    sb.Append(smallFontDict[i.Key]);
                    sb.Append("\"]");
                    f.Add(sb.ToString());
                }
                return f;
            }
        }


        public List<string> wrappedTexts {
            get {
                List<string> result = new List<string>();
                foreach (TextItem ti in this.tis) result.Add(ti.wrappedTransText);
                return result;
            }
        }
    }
}

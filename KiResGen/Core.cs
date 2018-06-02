using System;
using System.Collections.Generic;
using System.Collections;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text.RegularExpressions;
using System.Linq;


namespace KiResGen {
    class Core {
        private Dictionary<string, string> graphics;
        public const string B64TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-";

        private TextDict td;
        
        public Core() {
            this.graphics = new Dictionary<string, string>();
            this.td = new TextDict();
        }

        private void saveGraphStr() {
            StringBuilder sb = new StringBuilder();
            List<string> keys = this.graphics.Keys.ToList();
            for (int i = 0; i < keys.Count; i++) {
                if (i % 15 == 0) {
                    sb.AppendFormat("$G._set(\"g_src{0}\",[", i / 15);
                }
                sb.Append("[\"");
                sb.Append(keys[i]);
                sb.Append("\",\"");
                sb.Append(graphics[keys[i]]);
                sb.Append("\"],");
                if (i % 15 == 14) {
                    sb.Remove(sb.Length - 1, 1);
                    sb.AppendLine("]);");
                }
            }
            if (keys.Count % 15 != 0) {
                sb.Remove(sb.Length - 1, 1);
                sb.AppendLine("]);");
            }
            File.WriteAllText("g_src.as", sb.ToString());
        }

        public static string toBase64(byte[] src) {
            StringBuilder sb = new StringBuilder();
            int i = 0;
            int r = src.Length % 3;
            for (; i < src.Length - r; i += 3) {
                sb.Append(B64TABLE[(src[i] >> 2) & 0x3f]);
                sb.Append(B64TABLE[((src[i] & 0x3) << 4) | ((src[i + 1] >> 4) & 0xf)]);
                sb.Append(B64TABLE[((src[i + 1] & 0xf) << 2) | ((src[i + 2] >> 6) & 0x3)]);
                sb.Append(B64TABLE[(src[i + 2] & 0x3f)]);
            }
            if (r == 1) {
                sb.Append(B64TABLE[(src[i] >> 2) & 0x3f]);
                sb.Append(B64TABLE[((src[i] & 0x3) << 4)]);
                sb.Append("==");
            } else if (r == 2) {
                sb.Append(B64TABLE[(src[i] >> 2) & 0x3f]);
                sb.Append(B64TABLE[((src[i] & 0x3) << 4) | ((src[i + 1] >> 4) & 0xf)]);
                sb.Append(B64TABLE[((src[i + 1] & 0xf) << 2)]);
                sb.Append('=');
            }
            return sb.ToString();
        }

        private string BitmapToString(string filepath) {
            Bitmap bmp = new Bitmap(filepath);
            if (bmp.PixelFormat != PixelFormat.Format32bppArgb) {
                Log.Warn(filepath + ": 该文件不包含Alpha通道");
            }
            if (bmp.Size.Height >= 256 || bmp.Size.Width >= 256) {
                Log.Err(filepath + ": 图像过大，跳过");
                return null;
            }
            // 编码格式：
            // byte 1: width
            // byte 2: height
            // byte 3: colors (0 for a pic with more than 128 colors)
            // for a pic with no more than 255 colors:
            //      btye 4~4(n+1): color dictionary
            //      byte 4(n+1)+1~end: payload(level 1)
            //      1st level payload (RLC-mod):
            //          byte 1: dict size
            //          byte 2~3*n+2: dict
            //          byte ~end: compressed data
            // for a pic with more than 255 colors:
            //      byte 4~end: bitmap data
            List<byte> b = new List<byte>();
            Dictionary<Color, byte> dict = new Dictionary<Color, byte>();
            b.Add((byte)(bmp.Width & 0xFF));
            b.Add((byte)(bmp.Height & 0xFF));
            for (int i = 0; i < bmp.Size.Height; i++) {
                for (int j = 0; j < bmp.Size.Width; j++) {
                    Color c = bmp.GetPixel(j, i);
                    if (dict.ContainsKey(c) == false) {
                        dict.Add(c, (byte)(dict.Count & 0xFF));
                    }
                }
            }
            int oC = -1;
            if (dict.Count > 128) {
                b.Add((byte)0);
                for (int i = 0; i < bmp.Size.Height; i++) {
                    for (int j = 0; j < bmp.Size.Width; j++) {
                        Color c = bmp.GetPixel(j, i);
                        b.Add(c.A);
                        b.Add(c.R);
                        b.Add(c.G);
                        b.Add(c.B);
                    }
                }
            } else {
                b.Add((byte)dict.Count);
                foreach (var item in dict) {
                    Color c = item.Key;
                    b.Add(c.A);
                    b.Add(c.R);
                    b.Add(c.G);
                    b.Add(c.B);
                }
                List<byte> bytearray = new List<byte>();
                for (int i = 0; i < bmp.Size.Height; i++) {
                    for (int j = 0; j < bmp.Size.Width; j++) {
                        bytearray.Add(dict[bmp.GetPixel(j, i)]);
                    }
                }
                // 改进的游程编码，3字节一组，选取命中最多的且连续组数大于2的
                Dictionary<uint, RLCItem> dict2 = new Dictionary<uint, RLCItem>();
                uint last = 0xFFFFFFFF;
                for (int i = 0; i < bytearray.Count-3; i+=3) {
                    uint j = ((uint)bytearray[i] << 16) | ((uint)bytearray[i + 1] << 8) | ((uint)bytearray[i + 2]);
                    if (dict2.ContainsKey(j)) {
                        if (last != j && last != 0xFFFFFFFF) {
                            dict2[last].rst();
                        }
                        dict2[j].inc();
                    } else {
                        if(last != 0xFFFFFFFF) dict2[last].rst();
                        dict2.Add(j, new RLCItem());
                    }
                    last = j;
                }
                dict2[last].rst();

                List<uint> dout = (from kv in dict2
                                  where kv.Value.max_seq > 1
                                  orderby kv.Value.count descending
                                  select kv.Key).ToList();
                if (dout.Count > 127) {
                    dout.RemoveRange(127, dout.Count - 127);
                }
                b.Add((byte)dout.Count);
                oC = b[4*dict.Count + 3];
                for (int i = 0; i < dout.Count; i++) {
                    b.Add((byte)((dout[i] >> 16) & 0xFF));
                    b.Add((byte)((dout[i] >> 8) & 0xFF));
                    b.Add((byte)(dout[i] & 0xFF));
                }
                int idx = 0;
                last = 0xFFFFFFFF;
                for (; idx < bytearray.Count - 3; idx += 3) {
                    uint j = ((uint)bytearray[idx] << 16) | ((uint)bytearray[idx + 1] << 8) | ((uint)bytearray[idx + 2]);
                    if (dout.Contains(j)) {
                        if (last == j) {
                            if (b[b.Count - 1] == 0xFF) {
                                // set a new session
                                b.Add((byte)(dout.IndexOf(j) | 0x80));
                                b.Add((byte)1);
                            } else {
                                b[b.Count - 1] += 1;
                            }
                        } else {
                            b.Add((byte)(dout.IndexOf(j) | 0x80));
                            b.Add((byte)1);
                        }
                    } else {
                        b.AddRange(bytearray.GetRange(idx, 3));
                    }
                    last = j;
                }
                b.AddRange(bytearray.GetRange(idx, bytearray.Count - idx));
            }
            Console.WriteLine("{0}: Color={1}, size={2}x{3}, compress rate={4:P2}({5}/{6}), odC={7}", filepath, dict.Count, bmp.Width, bmp.Height, b.Count / (double)(bmp.Width * bmp.Height * 4), b.Count, (bmp.Width * bmp.Height * 4), oC);
            return Core.toBase64(b.ToArray());
        }

        
        public void test() {
           
        }

        private void transformGraph() { 
            foreach(string str in Directory.EnumerateFiles("graph", "*")){
                string fn = Path.GetFileNameWithoutExtension(str);
                if (Regex.IsMatch(fn, @"^[a-zA-Z]\w*$") == false) {
                    Log.Err(str + "is not a valid filename.");
                    continue;
                }
                try {
                    string result = this.BitmapToString(str);
                    if (result != null) {
                        this.graphics.Add(fn, result);
                    }
                } catch (Exception ex) {
                    Log.Err("open file error");
                    Log.Err(ex.Message);
                    Log.Info(ex.StackTrace);
                }
            }
            if (this.graphics.Count > 0) {
                this.saveGraphStr();
            }
        }

        private void saveStringList() {
            using (StreamWriter sw = File.CreateText("text.as")) {
                sw.Write("$G._set(\"text_lib\",[");
                sw.Write(String.Join(",", td.wrappedTexts));
                sw.WriteLine("]);");
                sw.Flush();
                sw.Write("$G._set(\"font_lib\",[");
                sw.Write(String.Join(",", td.fontLib));
                sw.WriteLine("]);");
                sw.Flush();
                sw.Write("$G._set(\"font_sm\",[");
                sw.Write(String.Join(",", td.smallFontLib));
                sw.WriteLine("]);");
                sw.Flush();
            }
        }

        private string wrapWithQuote(string src) {
            return string.Format("\"{0}\"", src);
        }

        private string csvToAs3(string csvline) {
            StringBuilder sb = new StringBuilder();
            sb.Append('[');
            string[] ss = csvline.Split(',');
            for (int i = 0; i < ss.Length; i++) {
                string s = ss[i].Trim();
                if (Regex.IsMatch(s, @"^-?\d+$") == false) {
                    // string
                    ss[i] = wrapWithQuote(ss[i]);
                } else {
                    ss[i] = s;
                }
            }
            sb.Append(String.Join(",", ss));
            sb.Append(']');
            return sb.ToString();
        }

        private void translateCSV(string fn) {
            if (File.Exists(string.Format("{0}.csv", fn))) {
                string[] strs = File.ReadAllLines(string.Format("{0}.csv", fn));
                using (StreamWriter sw = File.CreateText(string.Format("{0}.as", fn))) {
                    sw.Write(string.Format("$G._set(\"{0}s\",[", fn));
                    for (int i = 0; i < strs.Length - 1; i++) {
                        sw.Write(csvToAs3(strs[i]));
                        sw.Write(',');
                    }
                    sw.Write(csvToAs3(strs[strs.Length - 1]));
                    sw.Write("]);");
                    sw.Flush();
                }
                Log.Info(string.Format("{0}转换完成", fn));
                
            } else {
                Log.Err(string.Format("{0} file is not exist", fn));
            }
        }

        private void translateSkill() {
            int[] up = {5,6,7,8,12};
            if (File.Exists("skill.csv")) {
                using (StreamWriter sw = File.CreateText("skill.as")) {
                    sw.WriteLine("var skills=[];");
                    foreach (string str in File.ReadAllLines("skill.csv")) {
                        List<string> s = str.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries).ToList();
                        if (up.Contains(int.Parse(s[2]))) {
                            s[4] = "500";
                        }
                        sw.Write("skills[");
                        sw.Write(s[0]);
                        sw.Write("]=[");
                        sw.Write(string.Join(",", s.GetRange(1, s.Count - 1)));
                        sw.Write("];");
                    }
                    sw.WriteLine("$G._set(\"skills\",skills);");
                    sw.Flush();
                }
                Log.Info("Skill 转换完成");
            } else {
                Log.Err("Skill file is not exist.");
            }
        }

        public void run(bool textonly = false) {
            if (!textonly) {
                if (Directory.Exists("graph")) {
                    this.transformGraph();
                } else {
                    Log.Err("graph directory is not exist");
                }
                Log.Info("图像转换完成");
            }
            if (File.Exists("text.csv")) {
                this.td = new TextDict();
                foreach (string str in File.ReadAllLines("text.csv")) {
                    try {
                        td.add(str);
                    } catch (Exception ex) {
                        Log.Err(string.Format("{0}, text={1}", ex.Message, str));
                    }
                }
                td.translate();
                saveStringList();
                Log.Info("文本转换完成");
            } else {
                Log.Err("text file is not exist");
            }
            if (!textonly) {
                translateCSV("poke");
                translateCSV("item");
                translateSkill();
            }
        }

        
    }
}
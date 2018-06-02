using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.IO;
using System.Drawing;


namespace KiResGen {
    class Program {
        static void Main(string[] args) {
            Console.WriteLine("KiResGen - Resouces Generator for KichikuEngine");
            Console.WriteLine("    在使用本转换程序之前，首先确保所有的位图文件保存在当前目录的graph文件夹下，文字文档：text.csv，宠物数据：poke.csv，技能数据：skill.csv。具体文件格式见文档。");
            Console.WriteLine("    本程序还可以对KichikuEngine的脚本进行压缩，script.as -> script.min.as");
            Console.WriteLine("    本程序会将输出的结果保存到当前文件夹。");
            Console.WriteLine("\n=====================================================\n");
            Console.WriteLine("转换选项：");
            Console.WriteLine("1. 转换资源(全部)\n2. 转换资源(仅文本)\n3. 压缩脚本");
            Console.Write("请输入选项：");
            switch (Console.ReadLine().TrimStart()[0]) {
                case '1':
                    Console.WriteLine("开始进行资源转换...");
                    (new Core()).run();
                    break;
                case '2':
                    Console.WriteLine("开始转换文本…");
                    (new Core()).run(true);
                    break;
                case '3':
                    Console.WriteLine("开始脚本压缩...");
                    try {
                        Compress();
                    } catch (Exception e) {
                        Console.WriteLine(e.Message);
                        Console.WriteLine(e.StackTrace);
                    }
                    break;
                default:
                    Console.WriteLine("无效选项，默认进行资源转换操作");
                    for (float s = 8f; s < 10f; s += 0.1f) {
                        Bitmap bmp = new Bitmap(10, 10);
                        Graphics g = Graphics.FromImage(bmp);
                        //文泉驿点阵正黑
                        Font f = new Font("Zfull-GB", s, FontStyle.Regular, GraphicsUnit.Pixel, (byte)134);
                        g.TextRenderingHint = System.Drawing.Text.TextRenderingHint.ClearTypeGridFit;
                        g.DrawString("金", f, Brushes.Black, new RectangleF(-1, 0, 10, 10));
                        bmp.Save(s.ToString() + ".png");
                    }
                    break;
            }
            Console.WriteLine("按任意键继续。");
            Console.Read();
        }
        /// <summary>
        /// 进行如下操作：
        /// 1. 删除每行前后空格，以及行内任何不必要的空格
        /// 2. 删除注释
        /// 3. 合并到同一行
        /// </summary>
        public static void Compress() {
            try {
                StringBuilder sb = new StringBuilder();
                foreach (string str in File.ReadAllLines("script.as")) {
                    string s = str.Trim();
                    if (s.Length == 0) continue;
                    if (s.StartsWith("//")) continue;
                    bool in_c = false;
                    char c = s[0];
                    for (int i = 0; i < s.Length; i++) {
                        c = s[i];
                        if (c == '"') in_c = !in_c;
                        
                        if (c == ' ' && !in_c) {
                            if (i >= 3 && s.Substring(i - 3, 3) == "var" && s[i + 1] != ' ') { }
                            else if (i >= 8 && s.Substring(i-8, 8) == "function" && (s[i+1] != '(' || s[i+1] != ' ')){} 
                            else if (i >= 6 && s.Substring(i - 6, 6) == "return" && s[i + 1] != ' ') { } 
                            else if (i >= 4 && s.Substring(i - 4, 4) == "case" && s[i + 1] != ' ') { } 
                            else if (i >= 4 && s.Substring(i - 4, 4) == "else" && s[i + 1] != ' ' && s[i+1]!='{') { }
                            else continue;
                        };
                        sb.Append(c);
                    }
                }
                File.WriteAllText("script.min.as", sb.ToString());
                Console.WriteLine("转换完成");
            } catch (Exception e) {
                throw e;
            }
        
        }
    }
}

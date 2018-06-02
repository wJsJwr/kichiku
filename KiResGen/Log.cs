using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KiResGen {
    class Log {
        public static void Warn(string message) {
            Log.printLog("Warn", message);
        }

        public static void Info(string m) {
            Log.printLog("Info", m);
        }

        public static void Err(string m) {
            Log.printLog("Error", m);
        }

        public static void printLog(string ltype, string message) {
            Console.WriteLine(String.Format("[{0}] {1}", ltype, message));
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KiResGen {
    class TextItem {
        public string srcText;
        public string transText;
        public int no;
        public string sceneNo;
        public TextItem(int no, string src, string scno){
            this.srcText = src;
            this.no = no;
            this.sceneNo = scno;
        }
        public string wrappedTransText {
            get {
                if (string.IsNullOrEmpty(this.sceneNo)) {
                    return string.Format("[\"{0}\",\"{1}\"]", this.transText, this.no);
                }
                return string.Format("[\"{0}\",\"{1}\", {2}]", this.transText, this.sceneNo, this.no);
            }
        }
    }
}

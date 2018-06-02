using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KiResGen {
    class RLCItem {
        public int seq;
        public int max_seq;
        public int count;
        public RLCItem() {
            this.seq = 1;
            this.max_seq = int.MinValue;
            this.count = 1;
        }
        public void rst() {
            if (this.seq > this.max_seq) {
                this.max_seq = this.seq;
            }
        }
        public void inc() {
            this.seq++;
            this.count++;
        }
    }
}

### andy.dustin@gmail.com [rev: 9a5f44f]
#!/bin/bash

find . -type f -exec md5sum {} + | egrep -v '\./md5sums|\./\.git/|\./\./old' | sort -k2 | tee md5sums

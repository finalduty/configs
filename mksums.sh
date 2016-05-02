#!/bin/bash

find . -type f -exec md5sum {} + | egrep -v '\./md5sums|\./\.git|\./\./old' | tee md5sums
git add md5sums 2>/dev/null && git commit -m "Updated md5sums"

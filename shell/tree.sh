#!/bin/sh
# ftree: Usage: ftree [any directory]
dir=${1:-.}
(cd $dir; pwd)
find $dir -type d -print 2>/dev/null|awk '!/\.$/ {for (i=1;i<NF;i++){d=length($i);if ( d < 5 && i != 1 )d=5;printf("%"d"s","|")}print "---"$NF}' FS='/'


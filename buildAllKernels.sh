#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Usage : $0 <CCOMPILER>"
    exit
fi

for kernel in SVS_BFS SVS_BFS-LV SVS_BFS-ULV SVS_CFS SVS_CFS-LV SVS_CFS-ULV
do
    ./makeKernel.sh $1 $kernel
done

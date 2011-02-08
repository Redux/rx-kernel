#!/bin/sh

if [ $# -eq 0 ]
then
    echo "$0 <kernel version>"
    exit
fi

rm -rf flash/system/lib/modules/*
#mkdir flash/system/lib/modules/$1
#mkdir flash/system/lib/modules/$1/kernel
#tar cvzf modules.tgz `find . -name '*.ko'` 
#cd flash/system/lib/modules/$1/kernel
#tar xvzf ../../../../../../modules.tgz
#cd -
#rm modules.tgz
modules=`find . -name '*.ko'`
for f in $modules
do
    cp $f flash/system/lib/modules
done

cp arch/arm/boot/zImage flash/kernel

cd flash
zip -r ../kernel.zip .
cd ..

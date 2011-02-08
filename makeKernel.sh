#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Usage : $0 <CCOMPILER> [version]"
    exit
fi

kernel="SVS_BFS"

if [ "$2" != "" ];
then
    echo $2
    kernel=$2
fi

kernelBaseName="Redux"
CCOMPILER=$1

#configFile="arch/arm/configs/$kernelBaseName_defconfig"
# hardcoded for now...
configFile="arch/arm/configs/"$kernelBaseName"_"$kernel"_defconfig"
echo $configFile

echo "************************************"
echo "***** Make $kernelBaseName-$kernel ...."
echo "************************************"
fgrep -v "CONFIG_LOCALVERSION=" $configFile > .config
if [ ! $? -eq 0 ]
then
    exit
fi
echo "CONFIG_LOCALVERSION=\"-$kernelBaseName-$kernel\"" >> .config
make CROSS_COMPILE=$CCOMPILER ARCH=arm
if [ ! $? -eq 0 ]
then
    exit
fi
cp .config $configFile
./mkflash.sh $kernelBaseName-$kernel
zipName=$kernelBaseName-$kernel.zip
rm -f $zipName
mv kernel.zip $zipName

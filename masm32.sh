#!/bin/bash
PP="programs"
echo ""
cp $PP/$1.asm ./
echo "Mounting..."
echo ""
wine ml.exe -c -Zi -Fl -nologo $1.asm
echo ""
echo "Linking..."
echo ""
wine link.exe /DEBUG /MAP /SUBSYSTEM:CONSOLE libs/Kernel32.Lib libs/User32.lib libs/Irvine32.lib $1.obj
echo "Executing..."
echo ""
mv ./$1.exe /tmp/$1.exe
wineconsole /tmp/$1.exe
cp *.ro /tmp/
rm $1.*

#!/bin/bash
echo "Mounting..."
wine ml.exe -c -Zi -Fl $1.asm 
echo "Linking..."
wine link.exe /DEBUG /MAP /SUBSYSTEM:CONSOLE libs/Kernel32.Lib libs/User32.lib libs/Irvine32.lib $1.obj
wine $1.exe

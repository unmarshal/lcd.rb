#!/bin/sh

echo "export LCD=`pwd`" >> ~/.lcd
cat bash-aliases >> ~/.lcd
echo "source ~/.lcd" >> ~/.bashrc

. ~/.bashrc

acd lcd

echo "Installed successfully. Reload your .bashrc file `. ~/.bashrc`"

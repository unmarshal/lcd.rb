#!/bin/sh

grep "source ~/.lcd" ~/.bashrc
FOUND=$?

if [ $FOUND -ne 0 ]; then
  touch ~/.lcdrc
  echo "export LCD=`pwd`" > ~/.lcd
  cat bash-aliases >> ~/.lcd
  echo "source ~/.lcd" >> ~/.bashrc
  source ~/.lcd
  echo "Installed successfully. Reload your .bashrc file `. ~/.bashrc`"
else
  echo "Already installed"
fi

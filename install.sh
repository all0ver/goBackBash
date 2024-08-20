#!/bin/bash

mv cdb /usr/bin/cdb
chmod 777 /usr/bin/cdb

if [ -f ~/.zshrc ]; then
  echo "alias cd='echo \"\$PWD\" >> ~/.cd_log.txt; builtin cd'" >> ~/.zshrc
fi

if [ -f ~/.bashrc ]; then
  echo "alias cd='echo \"\$PWD\" >> ~/.cd_log.txt; builtin cd'" >> ~/.bashrc
fi

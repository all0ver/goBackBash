#!/bin/bash

if [ -f ~/ .zshrc]; then
  echo `alias cd='echo "$PWD" >> ~/.cd_log.txt; builtin cd'` >> ~/.zshrc

if [ -f ~/ .bashrc]; then
  echo `alias cd='echo "$PWD" >> ~/.cd_log.txt; builtin cd'` >> ~/.bashrc


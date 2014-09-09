#!/bin/bash

for i in {0..255}
do
  printf "\x1b[38;5;${i}mcolour${i} "
  j=`expr $i % 10`
  if [ $j -eq 0 ] ;then
      printf "\n"
  fi
done
printf "\n"

#!/bin/bash

echo "This script is able to update the pacman max visibility to 10, 20 or 30 cells from his position."
echo "Usage: ./updatePacmanSize.sh [10,20,30]"

if [ "$1" != "10" -a "$1" != "20" -a "$1" != "30" ]; then
  echo "\nYou can update the pacman visibility to 10, 20 or 30"
  return
fi

for entry in "./pacman/shots"/*
do
  sed -i "s/number(1..[[:digit:]]\{1,2\})./number(1..$1)./g" $entry  
  sed -i "s/distance(1..[[:digit:]]\{1,2\})./distance(1..$1)./g" $entry  
done
sed -i "s/distance(1..[[:digit:]]\{1,2\})./distance(1..$1)./g" "./pacman/encodings/pacman.asp"  
sed -i "s/Min=[[:digit:]]\{1,2\}/Min=$1/g" "./pacman/encodings/pacman.asp"

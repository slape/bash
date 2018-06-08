#!/usr/bin/env bash


#counting numbers with a for loop.
#Bash allows two different syntaxes.

#lists numbes 0 - 5
for (( i = 0; i < 6; i++ )); do
  echo $i
done

echo ""

#lists numbes 0 - 5
for i in {0..5}; do
  echo $i
done

echo ""

#lists only odd numbers
for (( i = 0; i <= 99; i++ )); do
    if  (( $i % 2 != 0 )); then
        echo $i
    fi
done

echo ""

#loops through the files in the directory and applies an action (ls in this case)
dirlist=`ls`
for i in $dirlist; do
  ls $i
done

echo ""

#while loops

#list the numbers 0 - 5
x=0
while [[ $x -le 5 ]]; do
  echo $x
  let x+=1
done

echo ""

#loop through all the files in a directory and print files owned by root.
ls -la | while read line; do
  fileName=`echo $line | awk '{print $9}'`
  owner=`echo $line | awk '{print $3}'`
  if [[ $owner == "root" ]]; then
    echo The file $fileName is owned by root.
  fi
done

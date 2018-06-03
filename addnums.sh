#!/usr/bin/env bash
#simple script to practice using variables
let c=$1+$2

if [[ $c -eq 10 ]]; then
  let c=500
elif [[ $c -gt 400 ]] && [[ $c -lt 600 ]]; then
  let c=1000
fi
echo $c

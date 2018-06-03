#!/bin/bash
#Determine a type of triangle.

echo Enter the integer of the first side:
read x
echo Enter the integer of the second side:
read y
echo Enter the integer of the third side:
read z

if (( $x == $y && $x == z )); then
  echo ''
  echo This is an equilateral triangle.
  echo ''
elif (( $x != $y && $x != $z && $y != $z )); then
  echo ''
  echo This is a scalene triangle.
  echo ''
elif (( $x != $y && $x == $z || $x != $z && $x == $y || $z == $y && $y != $x )); then
  echo ''
  echo This is an isosceles triangle.
  echo ''
fi

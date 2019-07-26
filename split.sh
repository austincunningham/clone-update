#!/bin/bash

# remove existing lists
#rm dir-list
#rm integr8ly-list

filename=list
declare -a myArray
myArray=(`cat "$filename"`)

# prints repo names
for (( i = 0 ; i <= 100 ; i=i+2))
do
  echo "${myArray[$i]}"
  echo "${myArray[$i]}" >> dir-list
done
echo ============================================================================================================
echo ==========================================break=============================================================
echo ============================================================================================================
# prints urls
for (( i = -1 ; i <= 100 ; i=i+2))
do
  echo "${myArray[$i]}"
  echo "${myArray[$i]}" >> integr8ly-list
done
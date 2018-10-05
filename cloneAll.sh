#!/bin/bash
# Author : Austin Cunningham
# uses a list of repos integr8ly-list to clone all in the list
cd ..
for i in `cat ./clone-update/integr8ly-list`;
do git clone "$i";
done

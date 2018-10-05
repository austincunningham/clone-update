#!/bin/bash

cd ..

echo Do you wish to clone all integr8ly repos ? y/n
read cloneYesNo

if [[ $cloneYesNo = "y"]] 
then
    # uses a list of repos integr8ly-list to clone all in the list
    for i in `cat ./clone-update/integr8ly-list`;
    do git clone "$i";
    done
fi

# find and execuits a git status
echo " "
echo "=================================================================================================="
echo " "
echo Do you wish to update all integr8ly repos? y/n
read updateYesNo

if [[$updateYesNo = "y" ]]
then
    find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} status \;
fi


echo " "
echo "=================================================================================================="
echo " "


# add removes changes origin to your fork
echo Do you wish to add a remote all integr8ly repos ? y/n
read addRemoteYesNo

if [[ $addRemoteYesNo = "y" ]] 
then
    echo Enter Git user name :
    read username
    for i in `cat ./clone-update/dir-list`;
    do 
        cd "$i"; 
        echo "$i" repo
        git remote rm origin ;
        git remote rm upstream;
        git remote add origin git@github.com:"$username"/"$i".git;
        git remote add upstream git@github.com:integr8ly/"$i".git
        git remote -v
        cd ..
    done
fi
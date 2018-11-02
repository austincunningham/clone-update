#!/bin/bash

cd ..

echo Do you wish to clone all integr8ly repos ? y/n
read cloneYesNo

if [ "$cloneYesNo" = "y" ] 
then
    # uses a list of repos integr8ly-list to clone all in the list
    for i in `cat ./    clone-update-integr8ly/integr8ly-list`;
    do git clone "$i";
    done
fi

# find and execuits a git pull upstream master 
echo " "
echo "=================================================================================================="
echo " "
echo Do you wish to update all integr8ly repos? y/n
read updateYesNo

if [ "$updateYesNo" = "y" ] 
then
    find . -maxdepth 1 -type d -print -execdir git --git-dir={}/.git --work-tree=$PWD/{} pull upstream master \;
    find . -maxdepth 1 -type d -print -execdir git --git-dir={}/.git --work-tree=$PWD/{} fetch upstream \;
fi


echo " "
echo "=================================================================================================="
echo " "


# add forking need hub installed https://hub.github.com/
echo Do you wish to fork the integr8ly repos? y/n
read forkYesNo

if [ "$forkYesNo" = "y" ]
then
    for i in `cat ./clone-update-integr8ly/dir-list`;
    do 
      cd "$i";
      pwd
      hub fork; 
      cd ..
    done
fi

# add removes changes origin to your fork
echo Do you wish to add a remote all integr8ly repos ? y/n
read addRemoteYesNo

if [ "$addRemoteYesNo" = "y" ] 
then
    echo Enter Git user name :
    read username
    for i in `cat ./      clone-update-integr8ly/dir-list`;
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
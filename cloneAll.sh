#!/bin/bash
NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
BLUE='\033[01;34m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
echo
echo -e ${GREEN}

echo -e ${GREEN} "======================================================================================="
echo -e ${CYAN} " _          _                       _____  _         ______                          "
echo -e ${CYAN} "| |        | |                     |  _  || |        | ___ \                         "
echo -e ${CYAN} "| |  _ __  | |_   ___   __ _  _ __  \ V / | | _   _  | |_/ /  ___  _ __    ___   ___ "
echo -e ${CYAN} "| | |  _ \ | __| / _ \ / _  ||  __| / _ \ | || | | | |    /  / _ \|  _ \  / _ \ / __|"
echo -e ${CYAN} "| | | | | || |_ |  __/| (_| || |   | |_| || || |_| | | |\ \ |  __/| |_) || (_) |\__ \\"
echo -e ${CYAN} "|_| |_| |_| \__| \___| \__, ||_|   \_____/|_| \__, | \_| \_| \___|| .__/  \___/ |___/"
echo -e ${CYAN} "                        __/ |                  __/ |              | |                "
echo -e ${CYAN} "                       |___/                  |___/               |_|                "
echo -e ${GREEN} "======================================================================================="
echo -e ${GREEN} "======================================================================================="

cd ..
echo -e ${BLUE}
echo " "
echo "=================================================================================================="
echo " "
echo Do you wish to clone all integr8ly repos ? y/n
read cloneYesNo


if [ "$cloneYesNo" = "y" ] 
then
    # uses a list of repos integr8ly-list to clone all in the list
    for i in `cat ./    clone-update-integr8ly/integr8ly-list`;
    do git clone "$i";
    done
fi

echo -e ${PURPLE}
echo " "
echo "=================================================================================================="
echo " "

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


echo -e ${YELLOW}
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


echo -e ${RED}
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

echo " "
echo "=================================================================================================="
echo " "
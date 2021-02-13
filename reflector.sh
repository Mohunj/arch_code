#!/bin/bash 
arch_upgrade()
{
sudo pacman -Syu
}
 sudo reflector --verbose --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
 
 FILE=/var/lib/pacman/db.lck
if test -f "$FILE"; then
    echo -e "\e[40;38;5;82m FOUND \e[30;48;5;82m $FILE \e[0m"
    #echo "FOUND $FILE "
    sudo rm "$FILE"
    arch_upgrade
    else
    echo -e "\033[31m \e[5m بدء الترقية \e[0m"
    #echo "بدء الترقية......."
    arch_upgrade
fi


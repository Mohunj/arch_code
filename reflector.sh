#!/usr/bin/env bash
#reflector.sh is a script to help you update mirrorlist
#written by:Mohammed Alhoussainy
#
#upgrade your system
arch_upgrade()
{
sudo pacman -Syu
}
locale_function()
{
loc=$(locale |grep LANG)
if [ "$loc" == 'LANG=ar_IQ.UTF-8' ]
then
a="جار الترقية"
b="وجد الملف "
c="تم حذف الملف"
elif [ "$loc" == 'LANG=en_US.UTF-8' ]
then
a="Upgrading start"
b="Found"
c="File deleted"
else
a="Upgrading Start"
b="found"
c="file deleted"
fi
}
locale_function
#The new command enable the user choosing the nomber of mirrors
#Also useing HTTPS & HTTP only
#If you need rsync delete "--protocol https --protocol http"
#CHEERS
 sudo reflector --verbose --latest $1 --protocol https --protocol http --sort rate --save /etc/pacman.d/mirrorlist
 if [ $? -eq 0 ];then
  echo "  "
  echo "mirrors saved"
  echo "  "
    FILE=/var/lib/pacman/db.lck
if test -f "$FILE"; then
    echo -e "\e[40;38;5;82m $b \e[30;48;5;82m $FILE \e[0m"
    #echo "FOUND $FILE "
    sudo rm "$FILE"
    echo "$FILE $c"
    arch_upgrade
    else
    echo -e "\033[31m \e[5m $a \e[0m"
    #echo "بدء الترقية......."
    arch_upgrade
fi
  else
   echo "  "
   echo "failed to save"
   echo "  "
   echo "No UPGREADE NEEDED"
   fi
  



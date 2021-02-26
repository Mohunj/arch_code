#!/usr/bin/env bash
#About me and the script
<<ABOUTME
 reflector.sh is a script to help you update mirrorlist
 written by:Mohammed Alhoussainy
 2021
ABOUTME
export m1 m2 m3 m4
#upgrade your system
PS1="Reflecting : "
arch_upgrade()
{
sudo pacman -Syu
}
#let's add some localization
locale_function()
{
loc=$(locale |grep LANG)
if [ "$loc" == 'LANG=ar_IQ.UTF-8' ]
then
a="جار الترقية"
b="وجد الملف "
c="تم حذف الملف"
d="تم حفظ المرايا بنجاح "
d1="للاسف فشل حفظ المرايا وهناك خطأ ما. "
m4=" لا حاجة للترقية"
else
a="Upgrading Start"
b="found"
c="file deleted"
d="Mirrors saved successfully"
d1="Something wrong , mirrors not saved"
m4="No UPGREADE NEEDED"
fi
}
#excute the localization function
locale_function
#The new command
<<HINT1
 The new command enable the user choosing the nomber of mirrors
 Also useing HTTPS & HTTP only
 If you need rsync delete "--protocol https --protocol http"
 CHEERS
HINT1
#if the number of mirrors is empty
mrr=${1:-40}
sudo reflector --verbose --latest "$mrr" --protocol https --protocol http --sort rate --save /etc/pacman.d/mirrorlist
 if [ $? -eq 0 ]
 then
  echo "  "
  echo -e "\e[35m $d \e[0m"
  echo "  "
    FILE=/var/lib/pacman/db.lck
    #check if file exist
if test -f "$FILE"; then
    echo -e "\e[40;38;5;82m $b \e[30;48;5;82m $FILE \e[0m"
    # File will be removed
    sudo rm "$FILE"
    echo -e"\e[31m $FILE $c \e[0m"
    #upgrade the system
    arch_upgrade
    else
    echo -e "\033[31m \e[5m $a \e[0m"
    #echo "بدء الترقية......."
    arch_upgrade
fi
  else
  #an error accourd
   echo "  "
   echo "$d1"
   echo "  "
   echo "$m4"
   fi
 



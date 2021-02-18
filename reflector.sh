#!/usr/bin/env bash
: 'reflector.sh is a script to help you update mirrorlist
 written by:Mohammed Alhoussainy

 upgrade your system
 '
export m1 m2 m3 m4
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
m1="يجب ادخال عدد المرايا التي تريدها"
m2="استعمال السكربت:sh reflector.sh n  حيث n عدد المرايا"
m3="حاول مرة اخرى"
m4=" لا حاجة للترقية"
else
a="Upgrading Start"
b="found"
c="file deleted"
d="Mirrors saved successfully"
d1="Something wrong , mirrors not saved"
m1="You should enter the nomber of mirros"
m2="Script usage : sh reflector.sh n , n= number of mirrors"
m3="try again later"
m4="No UPGREADE NEEDED"
fi
}
#excute the localization function
locale_function
:'The new command enable the user choosing the nomber of mirrors
 Also useing HTTPS & HTTP only
 If you need rsync delete "--protocol https --protocol http"
 CHEERS
'
#if the number of mirrors is empty
if [ -z "$1" ] 
 then
#print notification and exit
echo "$m1"
sleep 1
echo "$m2"
echo "$m3"
sleep 1
exit
fi
 sudo reflector --verbose --latest $1 --protocol https --protocol http --sort rate --save /etc/pacman.d/mirrorlist
 if [ $? -eq 0 ]
 then
  echo "  "
  echo "$d"
  echo "  "
    FILE=/var/lib/pacman/db.lck
    #check if file exist
if test -f "$FILE"; then
    echo -e "\e[40;38;5;82m $b \e[30;48;5;82m $FILE \e[0m"
    # File will be removed
    sudo rm "$FILE"
    echo "$FILE $c"
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
 



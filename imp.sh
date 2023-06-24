#!/bin/bash
select name in createfolder createfile listfolders listfiles
do
   case $name in 
   "createfolder" )
     read -p "enter the folder name : " foldername
     if [[ -d $foldername || -f $foldername ]]
     then 
       echo "already exsists ,so i will remove it"
       rm -rf $foldername  
       break
     else
       mkdir $foldername
       echo "just added"
       break
     fi
   ;;  
   "createfile" )     
      read -p "enter the file name : " filename
      if [[ -d $filename || -f $filename ]]
      then 
       echo "already exsists ,so i will remove it"
       rm $filename  
       break
      else
       touch $filename
       echo "just added"
       break
      fi
   ;;
   "listfolders" )
     find . -type d
   ;;
   "listfiles" )
     find . -type f
   esac 
done
#...........................................................

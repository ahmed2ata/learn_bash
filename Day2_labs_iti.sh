#!/bin/bash
#...........................DAY 2................
#4.Create a script called myls where:
# a. It lists the current directory, if it is called without arguments.
# b. Otherwise, it lists the given directory
if [ $# -eq 0 ]
then 
 ls .
else
 ls "$1"
fi
#5.Enhance the above script to support the following options individually:
# a. –l: list in long format
# b. –a: list all entries including the hiding files.
# c. –d: if an argument is a directory, list only its name
# d. –i: print inode number
# e. –R: recursively list subdirectories
select option in -l -a -d -i -R
do
 case $option in 
 "-l" )
  if [ $# -eq 0 ]
  then 
    ls -l .
  else
    ls -l "$1"
  fi
 ;; 
 "-a" )
   if [ $# -eq 0 ]
   then 
    ls -a .
   else
    ls -a "$1"
   fi
 ;; 
 "-d" )
  if [ $# -eq 0 ]
  then 
    ls -d .
  else
    ls -d "$1"
  fi
 ;; 
 "-i" )
  if [ $# -eq 0 ]
  then 
    ls -i .
  else
    ls -i "$1"
  fi
 ;; 
 "-R" )
  if [ $# -eq 0 ]
  then 
    ls -R .
  else
    ls -R "$1"
  fi
 ;; 
 esac  
done
#........................................................
# 6. Create a script called mytest where:
# a. It check the type of the given argument (file/directory)
if [ $# -eq 0 ]
then
 echo "please enter something"
elif [ -d $1 ]
then
 echo "the entery is a directory"
elif [ -f $1 ]
then
  echo "the entery is a file"
else
 exit
fi
# b. It check the permissions of the given argument (read/write/execute)
if [ $# -eq 0 ]; then
 echo "please enter something"
elif [ -x "$1" ]; then
  echo "$1 is executable"
elif [ -w "$1" ]; then
  echo "$1 is writable"
elif [ -r "$1" ]; then
  echo "$1 is readable"
else
  exit
fi
#.................................................................
#1 Create a script that asks for user name then send a greeting to him.

read -p "please enter your name : " name
echo "hello $name !"
#..............................................................
#2 Create a script called s1 that calls another script s2 where:
#a. In s1 there is a variable called x, it's value 5
#b. Try to print the value of x in s2 by two different ways

# in s1 
# x="5"
# bash s2

# in s2 
# echo $x

# in terminal 
# export x 
# . ./s1
#.................................................................
# 3.Create a script called mycd where:
# a. It changed directory to the user home directory, if it is called without arguments.
# b. Otherwise, it change directory to the given directory

if [ $# -eq 0 ]
then
 cd ~
else 
 cd "$1"
fi  

# run it sourcing "." 
#...................................................
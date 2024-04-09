#!/bin/bash

distro=$(cat /etc/os-release | grep 'NAME=' | cut -d '"' -f 2)

if [ "$distro" = "Ubuntu" ]; then
  sudo apt update -y
  sudo apt upgrade -y
elif [ "$distro" = "Fedora" ] || [ "$distro" = "Red Hat" ]; then
  sudo dnf update -y
  sudo dnf upgrade -y
elif [ "$distro" = "CentOS" ]; then
  sudo yum update -y
else
  echo "I have nothing to do with this Distro"
fi


# to do this script everyday at midnight youu will
#1- vim /etc/crontab
#then paste this after replace the script location with yours
#00 0    * * *   root    bash /home/ahmed/learn_bash/learning/assaimgent/update_and_upgrade.sh
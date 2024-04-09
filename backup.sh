#1!/bin/bash
cd /home/ahmed/
mkdir backup_dir
cd backup_dir
tar -czvf backup.tar.gz /home/ahmed

# then you configure cron to schedula this backup at the time you want
#for me I will configure it to run every friday at midnight like this:
#
##1- vim /etc/crontab
#then paste this after replace the script location with yours
#00 0 * * 5   root    bash /home/ahmed/learn_bash/learning/assaimgent/backup.sh
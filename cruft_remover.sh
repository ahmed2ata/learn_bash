read -p "what is the folder path you want to remove the cruft from it: " folder_path
read -p " how many days files should be unmodified for to be considered cruft: " days

cd ${folder_path}
readarray -t files < <(find . -maxdepth 1 -type f -mtime $days)
for elemnts in ${files[@]}; do
 rm -i ${elemnts}
done
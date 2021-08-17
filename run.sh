cd
cd /data/data/com.termux/files/home/storage/shared/Download

ide="$(find . -type f -name \*.cpp -printf "%T@ %p\0" |awk 'BEGIN {RS="\0";} {if (NR==1){minmtime=$1; $1=""; lastmodified=$0;} else if (minmtime<$1){minmtime=$1; $1=""; lastmodified=$0;}} END{print substr(lastmodified,4)}')";

input="$(find . -type f -name \*.txt -printf "%T@ %p\0" |awk 'BEGIN {RS="\0";} {if (NR==1){minmtime=$1; $1=""; lastmodified=$0;} else if (minmtime<$1){minmtime=$1; $1=""; lastmodified=$0;}} END{print substr(lastmodified,4)}')";


mv -t /data/data/com.termux/files/home/hackathon/ "$ide" "$input"
cd /data/data/com.termux/files/home/hackathon/ 
mv "$input" input.txt
c++ "$ide" -o h
./h

cp "$ide" output.txt /data/data/com.termux/files/home/storage/shared/backup/
mv -t /data/data/com.termux/files/home/storage/shared/cp "$ide" output.txt
cd /data/data/com.termux/files/home/storage/shared/cp
mv "$ide" code.cpp

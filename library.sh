#Use a local instance of the command line to `ssh` into the VM
ssh library_admin@127.0.0.1
bash
mkdir -p Solutions/Books
find . -iname "*catalog*" -exec cp {} Solutions \;
find . -iname "*brace*" -exec cp {} Solutions \;

#Use each line of the catalog to create a directory and search for the book chapters.
#clean up the catalog file.
cat ../catalog.info | tr -d "['\r]" > ../new_catalog.info
#send each line of the catalog file into a while loop.
cat ../new_catalog.info | while read l; do
#create a variable to format and hold the directory names (no spaces)
 dir=`echo $l | tr -d '[:space:]'`
#create a variable to format and hold the book title search string (underscores instead of spaces)
 bok=`echo $l | tr "[:upper:]" "[:lower:]" | sed 's/ /_/g'`
#use the directory variable to create a directory.
 mkdir $dir
#use the title variable to search fr the book chapters and copy them into the directory that was just made.
 find ../../ -type f -iname "*$bok*" -exec cp {} $dir \;
 #count the number of book chapters.
 chap=`ls -l $dir | wc -l`
 #if there ARE book chapters, use brace expansion to cat 0-[number of chapters] into one file.
 if (( $chap != 0 )); then
   cat $dir/{0..chap}_$bok.txt >> $dir/$bok.txt 2>/dev/null
#if there are no chapters for this book, remove the directory that was created for it.
 else
   rm -r $dir
 fi
done
#Should leave you with only directories that have book chapters in them along with the book file.
tar -c Solutions.gz Solutions

exit
scp library_admin@127.0.0.1:Solutions.gz .

# readarray books < ../catalog.info

# for ix in ${!books[*]}; do
#   echo "${books[$ix]}" | tr -d '[:space:]' | tr -d "'" | xargs mkdir
#   echo "${books[$ix]}" | tr -d "'" | sed 's/ /_/g'
#   find ../../ -type f -iname "${books[$ix]}" -exec cp {} . \;
# done

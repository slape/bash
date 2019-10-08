#create a few path variables
path="Solutions/Books"
catalog="Solutions/catalog.info"
# make the required directories
mkdir -p $path

#find the catalog and brace files | cat the catalog file into a new file to clean it up
find . -iname "*catalog*" -exec cat {} \; | tr -d "['\r]"> $catalog
find . -iname "*brace*" -exec cp {} Solutions \;
#Use each line of the catalog to create a directory and search for the book chapters.
#send each line of the catalog file into a while loop.
cat $catalog | while read l; do
#create a variable to format and hold the directory names (no spaces)
   dir=`echo $l | tr -d '[:space:]'`
#create a variable to format and hold the book title search string (underscores instead of spaces)
   bok=`echo $l | tr "[:upper:]" "[:lower:]" | sed 's/ /_/g'`
#use the directory variable to create a directory.
   mkdir $path/$dir
#use the title variable to search fr the book chapters and copy them into the directory that was just made.
   find . -type f -iname "*$bok*" -exec cp {} $path/$dir \;
 #count the number of book chapters and save the number to a variable.
   chap=`ls -l $path/$dir | wc -l`
   if [ $chap -lt 2 ]; then
     rm -r $path/$dir
   fi
done
#Should leave you with only directories that have book chapters in them along with the book file.
#if there ARE book chapters, use brace expansion to cat 0-[number of chapters] into one file.

cat Solutions/Books/MobyDick/{0..134}_moby_dick.txt >> $path/MobyDick/moby_dick.txt
cat Solutions/Books/HocusPocus/{0..42}_hocus_pocus.txt >> $path/HocusPocus/hocuspocus.txt
cat Solutions/Books/PrideandPrejudice/{0..42}_pride_and_prejudice.txt >> $path/PrideandPrejudice/PrideandPrejudice.txt
cat Solutions/Books/TomSawyer/{0..42}_tom_sawyer.txt >> $path/TomSawyer/TomSawyer.txt
cat Solutions/Books/Frankenstein/{0..42}_frankenstein.txt >> $path/Frankenstein/frankenstein.txt

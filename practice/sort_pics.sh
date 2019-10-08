#!/usr/bin/env bash
#pass pictures.zip as an argument.
#Create a Sorted_Folder and subfolders for each picture type
echo "Extracting Files and Pictures."

mkdir -p Sorted_Folder/jpgs Sorted_Folder/tiffs Sorted_Folder/pngs
unzip $1 -d Sorted_Folder
mv pictures Sorted_Folder
rm $1
jpgd="Sorted_Folder/jpgs"
tiffd="Sorted_Folder/tiffs"
pngd="Sorted_Folder/pngs"
report="Sorted_Folder/PictureCounts.md"

#Find all pics of each file type and move to its respective folder
echo "Finding Pictures by Type."
find . -iname *.jpg -exec cp {} $jpgd \;
find . -iname *.tiff -exec cp {}  $tiffd \;
find . -iname *.png -exec cp {} $pngd \;

#Count the number of occurences of each pic type and create a report with this info
echo "Creating Picture Type Report."
printf "Picture Counts by Type.\n---------------------------------------\n\n" > $report
printf "\nNumber of JPEGs:\n" >> $report
ls $jpgd | wc -l >> $report
printf "\nNumber of TIFFs:\n" >> $report
ls $tiffd | wc -l >> $report
printf "\nNumber of PNGs:\n" >> $report
ls $pngd | wc -l >> $report

echo "Finished Creating Report."

#!/usr/bin/env bash

# Assignment: Create (and execute) a shell script which accomplishes the following:
# Create a Sorted_Folder - and move into that folder
mkdir Sorted_Folder
cd Sorted_Folder
# Create subfolders for each document type
mkdir docx xlsx txt
# Find all files of each file type and move to its respective folder
find ../.. -iname *.docx -exec cp {} docx/ \;
find ../.. -iname *.xlsx -exec cp {}  xlsx/ \;
find ../.. -iname *.txt -exec cp {} txt/ \;
# Count the number of incidences of each file type
ls docx/ | wc -l
ls xlsx/ | wc -l
ls txt/ | wc -l

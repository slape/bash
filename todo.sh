#!/usr/bin/env bash

unzip $1
rm -r __MACOSX
report="Todos/ProductivityReport.md"
jen="Todos/Jennifer"
jon="Todos/John"
car="Todos/Carrie"
all="all.txt"
done="done.txt"
todo="unfinished.txt"
#1. Within each of the folders, create an **all.txt** file
#that combines the to-dos included in the individual's to-do lists.
find . -type f -iname "jennifer*" -exec cat {} \; > $jen/$all
find . -type f -iname "carrie*" -exec cat {} \; > $car/$all
find . -type f -iname "john*" -exec cat {} \; > $jon/$all
#2. Within each of the folders, create a file called **done.txt**
#that includes only to-dos marked as done. | Start the Final Productivity Report
printf "Items Completed:\n---------------------------------------\n\n" > $report
printf "\nCompleted by Jennifer\n" >> $report
grep -i "DONE" $jen/$all | tee $jen/$done | wc -l >> $report
printf "\nCompleted by Carrie\n" >> $report
grep -i "DONE" $car/$all | tee $car/$done | wc -l >> $report
printf "\nCompleted by John\n" >> $report
grep -i "DONE" $jon/$all | tee $jon/$done | wc -l >> $report
#3. Within each of the folders, create a file called **unfinished.txt** that
#includes only to-dos not marked as done. | Append to the Final Productivity Report.
printf "Items Yet ToDo:\n---------------------------------------\n\n" >> $report
printf "\nToDo for Jennifer\n" >> $report
grep -iv "DONE" $jen/$all | tee $jen/$todo | wc -l >> $report
printf "\nToDo for Carrie\n" >> $report
grep -iv "DONE" $car/$all | tee $car/$todo | wc -l >> $report
printf "\nToDo for John\n" >> $report
grep -iv "DONE" $jon/$all | tee $jon/$todo | wc -l >> $report

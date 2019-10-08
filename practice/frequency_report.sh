#!/usr/bin/env bash
#create a report that displays the number of break-in attempts for november and december.
#then display the number of attempts per hour.
#print the number of break-in attempts for November and December.
mkdir Reports
report='Reports/Frequency_Report.txt'
log='auth.txt'
echo "Finding Break-in Attempts for November."
printf "Automated Report of Break-In Attempts.\nBreak-In Attempts by Month.\n---------------------------------------\n\n" > $report
echo "November:" >> $report
grep -i 'nov' $log | grep -i 'break-in' | wc -l >> $report
echo "Finding Break-in Attempts for December."
echo "" >> $report
echo "December:" >> $report
grep -i 'dec' $log  | grep -i 'break-in' | wc -l >> $report
echo "" >> $report
#print the number of break-in attempts per hour:
echo "Finding Break-in Attempts per Hour."
printf "Break-In Attempts By Hour:\n---------------------------------------\n\n" >> $report

for i in {0..23}; do
    echo "Break-In Attempts During Hour: $i" >> $report
  if (( $i < 10 )); then
    grep -i "BREAK-IN" $log  | grep "0$i:[0-5][0-9]:[0-5][0-9]" | wc -l >> $report
  else
    grep -i "BREAK-IN" $log  | grep "$i:[0-5][0-9]:[0-5][0-9]" | wc -l >> $report
  fi
done

echo "Finding Uniqe IP Addresses that have attempted a Break-In"
printf "\n\nUnique IP Count:\n---------------------------------------\n\n" >> $report
grep -i "break-in" auth.txt | cut -d : -f4 | cut -d' ' -f8 | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort | uniq | wc -l >> $report
printf "\n\nIP Watch List:\n---------------------------------------\n\n" >> $report
grep -i "break-in" auth.txt | cut -d : -f4 | cut -d' ' -f8 | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort | uniq >> $report
echo "Finished Creating Report."
printf "\n---------------------------------------\nEND REPORT\n---------------------------------------" >> $report

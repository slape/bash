#!/usr/bin/env bash

#1. Create a folder called **AllRecords**.
echo "Extracting Records."
mkdir -p AllRecords/VIPCustomerOrders
unzip $1
rm -r __MACOSX
report="AllRecords/VIPCustomerOrders/VIPCustomerDetails.md"

echo "Creating Report of VIP Customers"
printf "Report of VIP Customers:\n---------------------------------------\n\n" > $report
#2. Copy all of the order records from 2012–2017 into the **AllRecords** folder.
find . -name '*.csv*' -exec cp {} AllRecords \;
#4. Find all orders from the VIP Customers Michael Davis or Michael Campbell. Include line and file names in the output.
#5. Move these specific files into the **VIPCustomerOrders** folder in the form of two files: **michael_campbell_orders.output** and **michael_davis_orders.output**.
echo "Orders for Michael Campbell" >> $report
grep -irn 'Michael,Campbell' AllRecords | tee AllRecords/VIPCustomerOrders/michael_campbell_orders.output | wc -l >> $report
echo "Orders for Michael Davis" >> $report
grep -irn 'Michael,Davis' AllRecords | tee AllRecords/VIPCustomerOrders/michael_davis_orders.output | wc -l >> $report
rm -r OrderRecords
rm OrderRecords.zip

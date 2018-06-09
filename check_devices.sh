#A script to check if one or more devices is offline. jq is required.
#If a deivce is offline this script sends an email notification.
#Schedule this script to run at whatever interval you would like using a cron job.

#change these variables to match the server you want to monitor
user=
restUrl=https://yourserver.com/apiv1
#enter the email address where you want to receive your notification.
email=your@email.com
#Enter the number of devices that SHOULD always be online.
deviceCount=16
#Change the server name to your server.
server='servername'

#Script gets the count of the currnet devices online and compares it to your deviceCount.
#If they are not equal it sends you an email to let you know.
#If the deviceCount is 0, you'll get an email that the server might be down or something else might be wrong.
currentDevices=`curl -u $user $restUrl/Device?availability=Online | jq '.[].name' | wc -l`

if (( $currentDevices == 0 )); then
  mail -s  "$server may be down or offline" $email <<< "The curl command for $server is not returning any data. Something is wrong."
elif  (( $deviceCount != $currentDevices )); then
  mail -s  "$server has a device offline" $email <<< "One or more devices has gone offline server $server"
fi

MANUFACTURER="$( sudo dmidecode --type 1 | grep "Manufacturer" | sed -e 's/.Manufacturer: //g' )"

SERIAL="$( sudo dmidecode --type 1 | grep "Serial Number" | sed -e 's/.*Serial Number: //' )"

IDENTIFIER="${MANUFACTURER}_${SERIAL}"

echo $IDENTIFIER

PRINT_IP=192.168.0.1

IP_BLOCK="10.0.2."

SPEC_LOCATION=/path/to/spec/files

SERVCHECK_LOCATION=/path/to/servCheck.sh

$SERVCHECK_LOCATION > $SPEC_LOCATION/$IDENTIFIER
while ! ifconfig | grep -F $IP_BLOCK > /dev/null;
do
	sleep 1
done

scp $SPEC_LOCATION/$IDENTIFIER $PRINT_IP:specs/$IDENTIFIER

ssh $PRINT_IP "cat specs/$IDENTIFIER | sed 's/^\(.\)/\1/' | lpr"

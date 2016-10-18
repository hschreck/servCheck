sudo dmidecode --type 1 | grep -E "Manufacturer|Product Name|Version|Serial Number" | grep -v "Version: Not Specified" | sed -e 's/Product Name:/Model/' -e 's/	//' 
sudo dmidecode --type 4 | grep -E "Socket Designation|Version|Core Count" | sed -e 's/Socket Designation: Proc/CPU: /g' -e 's/Version/Model/g' -e 's/(R)//g' -e 's/Core Count/Cores/g' -e 's/ CPU / /g' -e 's/	CPU/CPU/'
sudo dmidecode --type 8 | grep -E "External Reference Designator: USB" | tail -1 | sed -e 's/.*\([0-9]\)/USB Ports: \1/'
sudo dmidecode --type 8 | grep -E "External Reference Designator: NIC" | tail -1 | sed 's/.*\([0-9]\)/Network Ports: \1/'
sudo dmidecode --type 8 | grep -E "Serial Port" | sed -e 's/.*\(Serial Port\).*/\1/'
sudo dmidecode --type 16 | grep -E "Handle 0|Maximum Capacity|Number Of Devices" | sed -e 's/Handle 0x...\([0-9]\).*/Memory Bank: \1/' -e 's/Maximum Capacity/Bank Capacity/g' -e 's/Number Of Devices/Memory Slots in Bank/g'
sudo dmidecode --type 17 | grep -E "Type: " | tail -1 | sed 's/.Type/Memory Type/g'
echo -e "$( sudo dmidecode --type 39 | grep -E "Handle 0|Max Power Capacity" | sed -e 's/Handle 0x...\([0-9]\).*/Power Supply \1/' )"

lspci | grep Ethernet | tail -1 | sed -e 's/.*Ethernet.*:/Network Adapter:/'
lspci | grep RAID | tail -1 | sed -e 's/.*RAID.*:/RAID Controller:/'

#sysinfo.sh#File stored on the location COMP2101/bash

#To show the FQDN 
echo FQDN: $(hostname --fqdn)

#To show the OS details on the system
os=$(hostnamectl)
echo Operatingsystem and Version :
echo "$os"

#To show the IP address
echo IP address: $(hostname --all-ip-addresses)

#To show the storage file of system
echo Free Storage on rootfilesystem: 
df -h | grep Filesystem
df -h | grep /dev/sda3 

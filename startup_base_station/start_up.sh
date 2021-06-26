#!/bin/bash

CHECK_MARK="\033[0;32m\xE2\x9C\x94\033[0m"


echo "Launching system"
echo


echo -n "Turning on Network mask"
sleep 3
echo  -e "\\r${CHECK_MARK} The network mask is now on"
gnome-terminal --window-with-profile=masq -- sh /home/felix/Desktop/work_stuff/contents/masq.sh #change location



echo -n "Turing on the EPC"
sleep 3
gnome-terminal --window-with-profile=epc -- sh /home/felix/Desktop/work_stuff/contents/srsepc.sh #change location
echo -e "\\r${CHECK_MARK} The EPC is now on"


echo -n "Turning on the ENB"
sleep 5
gnome-terminal --window-with-profile=enb -- sh /home/felix/Desktop/work_stuff/contents/srsenb.sh #change location

echo -e "\\r${CHECK_MARK} The ENB is now on"

sleep 3
echo
echo "script is running..."

#!/bin/bash

# restart start time
startTime=$(date +%s)
echo -e "\033[0;31mCurrent Time is：$(date "+%Y-%m-%d %H:%M:%S") Restart Now!\033[0m"
./shutdown.sh
echo
sleep 2
echo
./startup.sh
# restart end time
endTime=$(date +%s)
echo -e  "\033[0;31mCurrent Time is：$(date "+%Y-%m-%d %H:%M:%S") Restart Success！Spend $((endTime - startTime)) seconds \033[0m";

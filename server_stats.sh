#!/bin/bash

echo CPU USAGE:
echo "$(top -b -n 1 | sed -n '3p')"
echo ""
echo MEMORY USAGE:
echo "$(free | grep Mem | awk '{printf "Memory Usage: %.2f%%\n", ($3/$2)*100}')"
echo "$(top -b -n 1 | sed -n '4,5p')"
echo ""
echo DISK USAGE:
echo "$(df -Ph | grep '^/dev/' | awk '{print $1, "  Size: "  $2,"Used: " $3 "/" $5, "Free: " $4 "/" 100-$5"%"}')"
echo ""
echo TOP PROCESS CPU USAGE:
echo "$(top -b -n 1 -o %CPU | sed -n '8,12p' | awk '{printf "Process ID:"$1 "\t" "Process command: " $12 "\t\t" "CPU usage: " $9"%" "\t\t" "MEM usage: " $10"%" "\n"}')"
echo ""
echo TOP PROCESS MEM USAGE:
echo "$(top -b -n 1 -o %MEM | sed -n '8,12p' | awk '{printf "Process ID:"$1 "\t" "Process command: " $12 "\t\t" "CPU usage: " $9"%" "\t\t" "MEM usage: " $10"%" "\n"}')"
echo ""
echo UPTIME:
echo "$(uptime)"
echo ""
echo OS VERSION:
echo "$(uname -a)"

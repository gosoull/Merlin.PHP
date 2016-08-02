#!/bin/sh
path=$(cd `dirname $0`; pwd)
echo "{"
# echo '  "Run Path": "'${path}'",'
echo '  "nvram_space": "'$(nvram get nvram_space)'",'
echo '  "ddns_hostname_x": "'$(nvram get ddns_hostname_x)'",'
echo '  "Processor": "'$(cat /proc/cpuinfo | grep 'Processor')'",'
echo '  "cpu usage": "'$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')'",'
echo '  "load average": "'$(uptime | grep -o 'load.*' | awk '{print $3,$4,$5}')'",'
echo '  "Memory Usage": "'$(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')'",'
echo '  "up time": "'$(uptime | awk -F'( |,|:)+' '{print $6,$7",",$8,"hours,",$9,"minutes."}')'",'
echo '  "CPU temperature": "'$(grep 'CPU temperature' /proc/dmu/temperature | awk '{print $4}')'",'
echo '  "在可运行状态的进程数目": "'$(grep 'procs_running' /proc/stat | awk '{print $2}')'",'
echo '  "the system booted time": "'$(grep 'btime' /proc/stat | awk '{print $2}')'",'
echo '  "MemTotal": "'$(grep 'MemTotal' /proc/meminfo | awk '{print $2} END {print "kB"}')'",'
echo '  "MemFree": "'$(grep 'MemFree' /proc/meminfo | awk '{print $2} END {print "kB"}')'",'
echo '  "Buffers": "'$(grep 'Buffers' /proc/meminfo | awk '{print $2} END {print "kB"}')'",'
echo '  "Cached": "'$(grep 'Cached' /proc/meminfo | awk '{print $2} END {print "kB"}')'",'
echo '  "VmallocTotal": "'$(grep 'VmallocTotal' /proc/meminfo | awk '{print $2} END {print "kB"}')'",'
echo '  "sda1 %": "'$(df | grep '/dev/sda1' | awk '{print $5}')'",'
echo '  "sda1 Used": "'$(df | grep '/dev/sda1' | awk '{print $3}')'",'
echo '  "sda1 Available": "'$(df | grep '/dev/sda1' | awk '{print $4}')'",'
echo '  "sdb1 %": "'$(df | grep '/dev/sdb1' | awk '{print $5}')'",'
echo '  "sdb1 Used": "'$(df | grep '/dev/sdb1' | awk '{print $3}')'",'
echo '  "sdb1 Available": "'$(df | grep '/dev/sdb1' | awk '{print $4}')'",'
echo '  "CPU TOP 5": "'$(top -n 1 | head -n 12  | tail -n 5 | awk '{print $1":"$9","}' )'",'
echo '  "et0macaddr": "'$(nvram get et0macaddr)'",'
echo '  "date": "'$(date)'"'
echo "}"

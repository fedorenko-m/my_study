#!/bin/bash

CPU_THRESHOLD=80
RAM_THRESHOLD=80

# CPU
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
CPU_INT=${CPU_USAGE%.*}  

#  RAM
RAM_USAGE=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')
RAM_INT=${RAM_USAGE%.*}

# Top 5 RAM CPU
TOP_PROCESSES=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6)

# Static
echo "CPU Usage: $CPU_USAGE%"
echo "RAM Usage: $RAM_USAGE%"
echo "Top 5 Processes:"
echo "$TOP_PROCESSES"

if [ "$CPU_INT" -gt "$CPU_THRESHOLD" ]; then
    echo "⚠️ Warning: High CPU usage ($CPU_USAGE%)"
fi

if [ "$RAM_INT" -gt "$RAM_THRESHOLD" ]; then
    echo "⚠️ Warning: High RAM usage ($RAM_USAGE%)"
fi

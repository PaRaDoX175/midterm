#!/bin/bash

LOG=/Users/ruslan/midterm-devops/absalyamov-ruslan-student-api/logs/Absalyamov_Ruslan_system_report.log

{
echo "================="
echo "Student Information"
echo "================="
echo
echo "Name: Ruslan"
echo "Surname: Absalyamov"
echo "Group: IT2-2313"
echo "Student ID: 37044"
echo
echo "================="
echo "System information"
echo "================="
echo
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current date: $(date)"
echo "Operating system: $(uname -s -r)"
echo "Disk usage:"
df -h /
echo "Memory usage:"
free -h
echo
} >> $LOG

cat $LOG


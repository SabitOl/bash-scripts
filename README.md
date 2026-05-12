# Bash Automation Scripts

## 1. disk-check.sh

The script checks usage of every partitions in the system. When any of the disk space used is above 80%, the script prints a WARNING message with percent used by each partition.

Otherwise, it prints a OK message with usage percentage.

## 2. ram-check.sh

This script checks the ram usage of your system and log the result to a ram_log file in your home directory. To make it run automatically on your system, setup a crontab. Here's how:

Run this in your terminal:
- crontab -e

- Add the below to the bottom of the page:
*/5 * * * * /root/path/to/your/ram-check.sh

This auto runs the script every five minutes

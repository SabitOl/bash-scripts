# Bash Automation Scripts

[![Bash Scripts CI](https://github.com/SabitOl/bash-scripts/actions/workflows/cI.yml/badge.svg)](https://github.com/SabitOl/bash-scripts/actions/workflows/cI.yml)

A collection of Linux automation scripts written in Bash.
Each script solves a real system administration task.

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

## 3. key-hunter.sh
The script search for secrets or private keys in staging area before commit. When a keyword containing "Private key" or "AWS_SECRET_ACCESS_KEY" is found in a file about to be committed, the commit stops. And the file won't be committed.

The script can be made to auto run on every commit by saving the script in .git/hooks/pre-commit.

For instance, your initialized folder is "bash-scripts".

You cd to the folder. Then:

- nano .git/hooks/pre-commit
- Save the key-hunter.sh content in pre-commit file

The script auto runs first before a file is committed.

You can adjust the search keyword in the script to the variable name you use to save private keys.



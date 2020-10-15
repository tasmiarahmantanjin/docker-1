#!/bin/sh
# Tests each command written in file

PAUSE=$1

if [ -z $1 ]
then
   PAUSE=5
fi   

for task in *;
do
	if [ $task != "test.sh" ]
	then
		ESC="\\033["
		printf $ESC"32mFile #$task"$ESC"0m";
		printf $ESC"32m Contents: "$ESC"0m" | cat - $task && echo;
		printf $ESC"32mOutput of EX: $task: "$ESC"0m";
		bash $task;
		printf $ESC"32mGoing to pause for $PAUSE seconds\n"
		printf $ESC"31m============================\n"$ESC"0m";
		sleep $PAUSE;
	fi;
done
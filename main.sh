#!/bin/bash
clear
if [ ! -f "data.txt" ]
then
	touch data.txt
	echo -e HUNGER=50 \\nFUN=50 \\nCLEAN=50 > data.txt
fi
if [ ! -f "monster.txt" ]
then
	touch monster.txt
	echo -e \\nNO MONSTER! EDIT monster.txt TO CREATE YOUR OWN ASCII MONSTER OR DOWNLOAD EL GATITO FROM github.com/Skilowi/ElGatito > monster.txt
fi
source data.txt
LOOP=1
while [ $LOOP -le 2 ]
do
	cat monster.txt
	echo
	echo Hunger:      $HUNGER
	echo Fun:         $FUN
	echo Cleanliness: $CLEAN
	echo
	if [ $HUNGER -le 30 ]
	then
		echo I am hungry!!!
	fi
	if [ $FUN -le 30 ]
	then
		echo Play with me! Please!!!
	fi
	if [ $CLEAN -le 30 ]
	then
		echo I am dirty!!!
	fi
	if [ $HUNGER -le -1 ]
	then
		HUNGER=0
	fi
	if [ $FUN -le -1 ]
	then
		FUN=0
	fi
	if [ $CLEAN -le -1 ]
	then
		CLEAN=0
	fi

	echo
	echo Press H to feed your monster!
	echo Press F to play with monster!
	echo Press C to wash your monster!
	echo

	if [ $RANDOM -le 900 ]
	then
		if [ $RANDOM -le 300 ]
		then
			HUNGER=$((HUNGER-1))
		fi
		if [ $RANDOM -le 700 ] && [ $RANDOM -gt 300 ]
		then
			FUN=$((FUN-1))
		fi
		if [ $RANDOM -ge 701 ]
		then
			CLEAN=$((CLEAN-1))
		fi
	fi
	input="none"
	read -rsn1 -t 1 input

	if [ "$input" = "c" ]
	then
		echo Cleaning!
		CLEAN=$((CLEAN+1))
		sleep 1
	fi
	if [ "$input" = "h" ]
	then
		echo Feeding!
		HUNGER=$((HUNGER+1))
		CLEAN=$((CLEAN-1))
		sleep 1
	fi
	if [ "$input" = "f" ]
	then
		echo Lets play!
		FUN=$((FUN+1))
		HUNGER=$((HUNGER-1))
		CLEAN=$((CLEAN-1))
		sleep 1
	fi
	input="none"
	echo -e HUNGER=$HUNGER \\nFUN=$FUN \\nCLEAN=$CLEAN > data.txt
	clear
done

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
	echo -e \\nNO MONSTER! EDIT monster.txt TO CREATE YOUR OWN ASCII MONSTER OR DOWNLOAD EL GATITO FROM \\e[94mgithub.com/Skilowi/ElGatito\\e[0m > monster.txt
fi


echo -e "================INSTRUCTION================="
echo -e "       Press \\e[92mH\\e[0m to feed your monster,"
echo -e "        Press \\e[33mF\\e[0m to play with him,"
echo -e "           and \\e[94mC\\e[0m to clean him!!"

sleep 3
clear
source data.txt
LOOP=1
while [ $LOOP -le 2 ]
do
	cat monster.txt
	echo

	echo -en "\e[92m"
	cat translations/indicators/hunger.txt | tr '\n' ' ' && #echo -en "Hunger:      "
	echo -en "\e[0m"
	echo $HUNGER

	echo -en "\e[33m"
	cat translations/indicators/fun.txt | tr '\n' ' ' && #echo -en "Fun:         "
	echo -en "\e[0m"
	echo $FUN

	echo -en "\e[94m"
	cat translations/indicators/clean.txt | tr '\n' ' ' && #echo -en "Cleanliness: "
	echo -en "\e[0m" 
	echo $CLEAN

	echo
	if [ $HUNGER -le 30 ]
	then
		echo -en "\e[31m"
	        cat translations/warnings/hunger.txt #echo -en "I am hungry!!!"
		echo -en "\e[0m"
	fi
	if [ $FUN -le 30 ]
	then
		echo -en "\e[31m"
		cat translations/warnings/fun.txt #echo -en "Play with me! Please!!!"
		echo -en "\e[0m"
	fi
	if [ $CLEAN -le 30 ]
	then
		echo -en "\e[31m"
		cat translations/warnings/clean.txt #echo -en "I am dirty!!!"
		echo -en "\e[0m"
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

	#echo

	#echo -e Press \\e[92mH\\e[0m to feed your monster!

	#echo -e Press \\e[33mF\\e[0m to play with monster!

	#echo -e Press \\e[94mC\\e[0m to wash your monster!

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
		echo -en "\e[94m"
		cat translations/ihavenoideahowtocallthis/clean.txt #echo -en "Cleaning!"
		echo -en "\e[0m"

		CLEAN=$((CLEAN+1))
		sleep 1
	fi
	if [ "$input" = "h" ]
	then
		echo -en "\e[92m"
		cat translations/ihavenoideahowtocallthis/hunger.txt #echo -en "Feeding!"
		echo -en "\e[0m"

		HUNGER=$((HUNGER+1))
		CLEAN=$((CLEAN-1))
		sleep 1
	fi
	if [ "$input" = "f" ]
	then
		echo -en "\e[33m"
		cat translations/ihavenoideahowtocallthis/fun.txt #echo -en "Lets play!"
		echo -en "\e[0m"

		FUN=$((FUN+1))
		HUNGER=$((HUNGER-1))
		CLEAN=$((CLEAN-1))
		sleep 1
	fi
	input="none"
	echo -e HUNGER=$HUNGER \\nFUN=$FUN \\nCLEAN=$CLEAN > data.txt
	clear
done

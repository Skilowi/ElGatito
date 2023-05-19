#!/bin/bash
clear
echo "Translation Generator"
echo
echo "You will be asked for your translation for specific line."

sleep 2

clear

cat indicators/hunger.txt
echo -n "Your translation: "
read -r input
> indicators/hunger.txt
echo $input > indicators/hunger.txt

sleep 1

clear

cat indicators/fun.txt
echo -n "Your translation: "
read -r input
> indicators/fun.txt
echo $input > indicators/fun.txt

sleep 1

clear

cat indicators/clean.txt
echo -n "Your translation: "
read -r input
> indicators/clean.txt
echo $input > indicators/clean.txt

sleep 1

clear

cat warnings/hunger.txt
echo -n "Your translation: "
read -r input
> warnings/hunger.txt
echo $input > warnings/hunger.txt

sleep 1

clear

cat warnings/fun.txt
echo -n "Your translation: "
read -r input
> warnings/fun.txt
echo $input > warnings/fun.txt

sleep 1

clear

cat warnings/clean.txt
echo -n "Your translation: "
read -r input
> warnings/clean.txt
echo $input > warnings/clean.txt

sleep 1

clear

cat ihavenoideahowtocallthis/hunger.txt
echo -n "Your translation: "
read -r input
> ihavenoideahowtocallthis/hunger.txt
echo $input > ihavenoideahowtocallthis/hunger.txt

sleep 1

clear

cat ihavenoideahowtocallthis/fun.txt
echo -n "Your translation: "
read -r input
> ihavenoideahowtocallthis/fun.txt
echo $input > ihavenoideahowtocallthis/fun.txt

sleep 1

clear

cat ihavenoideahowtocallthis/clean.txt
echo -n "Your translation: "
read -r input
> ihavenoideahowtocallthis/clean.txt
echo $input > ihavenoideahowtocallthis/clean.txt

sleep 1

clear

echo "Everything should be translated."

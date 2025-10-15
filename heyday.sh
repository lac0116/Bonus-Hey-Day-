# Name: Lauren Campbell
# Filename: heyday.sh
# Execution Instructions: Type and run "./heyday.sh" in terminal and hit enter


echo "Welcome to Hey Day Auburn Trivia!"

validName=0

# Purpose of while loop: validates name is not empty
# Since name is entered in the loop, validName variable must be updated to 1 to exit loop
while [ $validName -eq 0 ] 
do
	read -p "Enter your name: " name # -p allows prompt to be printed before expecting input
	if [ -z "$name" ]; then
		echo -e "No name entered. Please try again\n" # -e allows use of \n
	else
		validName=1
	fi
done

echo -e "\nHey $name! War Eagle!"

validCollege=0
validSport=0

# Purpose of while loop: validates college is not empty
# Since college is entered in the loop, validCollege must be updated to 1 to exit loop
while [ $validCollege -eq 0 ] # -eq comparator '=='
do
	echo -e "\nWhat college are you in?"
	echo -e "(Engineering/Business/Liberal Arts/Sciences/Agriculture/Education/Veterinary Medicine)"
	read college
	if [ -z "$college" ]; then
		echo -e "\nNo college entered. Please try again\n"
	else
		validCollege=1
	fi
done

# Purpose of while loop: validates sport is not empty
# Since college is entered in the loop, validSport must be updated to 1 to exit loop
while [ $validSport -eq 0 ]
do
	echo -e "\nWhat's your favorite Auburn sport?"
	echo -e "(Football/Basketball/Baseball/Gymnastics/Other)"
	read sport
	if [ -z "$sport" ]; then
		echo -e "\nNo sport entered. Please try again\n"
	else
		validSport=1
	fi
done

echo -e "\n---Your Auburn Connections---"

# --------Search Explanations------------
# grep -i "$college" auburn_notables.txt: searches auburn_notables.txt for lines with instances of $college, -i removes case 
# 	sensitivity if there is a capitalization error in input
# Pipelined to shuf -n 1: picks a random line, -n allows specification of 1 line
# Pipelined to  awk -F'|' '{print $1 " - " $4}': awk divides lines by '|' (-F allows delimiter specification), printing in brackets
# 	is the 1st and 4th field, which in auburn_notables.txt is the name and description field
#
# Result is stored in notable
 
notable=$(grep -i "$college" auburn_notables.txt | shuf -n 1 | awk -F'|' '{print $1 " - " $4}')

# If notable is found, then it prints it. Otherwise prints error message.
if [ -n "$notable" ]; then
	echo -e "\nFrom Auburn $college: $notable"
else
	echo -e "\nSorry, I could not find anyone from your college in my files right now. Make sure you are entering one of the listed options after the prompt!\n"
fi

# --------Search Explanations------------
# grep -i "$sport" auburn_notables.txt: searches auburn_notables.txt for lines with instances of $sport, -i removes case
#       sensitivity if there is a capitalization error in input
# Pipelined to shuf -n 1: picks a random line, -n allows specification of 1 line
# Pipelined to  awk -F'|' '{print $1 " - " $4}': awk divides lines by '|' (-F allows delimiter specification), printing in brackets
#       is the 1st and 4th field, which in auburn_notables.txt is the name and description field
#
# Result is stored in athlete

athlete=$(grep -i "$sport" auburn_notables.txt | shuf -n 1 | awk -F'|' '{print $1 " - " $4}')

# If athlete is found matching sport, then they are printed. Otherwise prints error message.

if [ -n "$athlete" ]; then
        echo -e "\nAuburn $sport legend: $athlete"
else
        echo "\nSorry, I could not find anyone from this sport in my files right now. Make sure you are entering one of the listed options after the prompt!\n"
fi

# ----------Search Explanations--------------
# awk '{printf "%s ", $0}' auburn_facts.txt: reads file and merges all lines into single line,
#     replaces line breaks with spaces so wrapped lines become one continuous line
# Pipelined to tr '.' '\n': replaces every period (.) with a newline, splits sentences that end w/periods into lines
# Pipelined to tr '!' '\n': replaces every exclamation mark (!) with a newline, same purpose
# Pipelined to sed '/^\s*$/d': deletes any empty lines
# Pipelined to shuf -n 1: randomly selects one line from the list
# Result directly printed

echo -e "\nAuburn Fun Fact: $(awk '{printf "%s ", $0}' auburn_facts.txt | tr '.' '\n' | tr '!' '\n' | sed '/^\s*$/d' | shuf -n 1)."
echo -e "\nWar Eagle, $name!"

# Name: Lauren Campbell
# Filename: heyday.sh
# Execution Instructions: Type and run "./heyday.sh" in terminal and hit enter


echo "Welcome to Hey Day Auburn Trivia!"

validName=0

# Purpose of while loop: validates name is not empty
# Since name is entered in the loop, validName variable must be updated to 1 to exit loop
while [validName -eq 0]
do
	read -p -n "Enter your name: " name # -p allows prompt to be printed before expecting input
	# -n removes automatic newline after printed prompt
	if [-z "$name"]; then
		echo -e "No name entered. Please try again\n" # -e allows use of \n
	else
		validName=1
	fi
done

echo "Hey $name! War Eagle!"

validCollege=0
validSport=0

# Purpose of while loop: validates college is not empty
# Since college is entered in the loop, validCollege must be updated to 1 to exit loop
while [$validCollege -eq 0] # -eq comparator '=='
do
	echo "What college are you in?"
	echo "(Engineering/Business/Liberal Arts/Sciences/Agriculture/Education/Veterinary Medicine)"
	read college
	if [-z "$college"]; then
		echo -e "No college entered. Please try again\n"
	else
		validCollege=1
	fi
done

# Purpose of while loop: validates sport is not empty
# Since college is entered in the loop, validSport must be updated to 1 to exit loop
while [$validSport -eq 0]
do
	echo "What's your favorite Auburn sport?"
	echo "(Football/Basketball/Baseball/Gymnastics/Other)"
	read sport
	if [-z "$sport"]; then
		echo -e "No sport entered. Please try again\n"
	else
		validSport=1
	fi
done

echo "---Your Auburn Connections---"

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
if [-n "$notable"]; then
	echo -n "From Auburn $college: $notable"
else
	echo "Sorry, I could not find anyone from your college in my files right now. Make sure you are entering one of the listed options after the prompt!"
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

if [-n "$athlete"]; then
        echo -n "Auburn $sport legend: $athlete"
else
        echo "Sorry, I could not find anyone from this sport in my files right now. Make sure you are entering one of the listed options after the prompt!"
fi

# ----------Search Explanations--------------
# awk 'BEGIN{RS=""; FS="\n"} {print $0}' auburn_facts.txt: awk organizes facts into lines because they are split up
# Pipelined to shuf -n 1: selects one field to print
echo "Auburn Fun Fact: $(awk 'BEGIN{RS=""; FS="\n"} {print $0}' auburn_facts.txt | shuf -n 1)"

echo "War Eagle, $name!"

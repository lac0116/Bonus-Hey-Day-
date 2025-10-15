# Bonus-Hey-Day-
heyday.sh script and .txt files to search

The Hey Day tradition is a day during the Fall semester at Auburn University where all students are encouraged to say "Hey!" to
one another. This is meant to foster community among students.

My heyday.sh script asks the student name, says hey, and then asks for their college and favorite sport.
Then, it uses grep to search the file auburn_notables.txt for an instance of a person that went to their college and an instance of a person who played their favorite sport. It uses awk to separate the name and description field and print.
Additionally, it randomly grabs a fun fact from the auburn_facts.txt file, using awk to cut facts that span multiple lines into fields and uses shuf to select one fact and prints.

Usage instructions: Type in command "./heyday.sh" and hit enter

Example output:
Welcome to Hey Day Auburn Trivia!
Enter your name: Lauren C

Hey Lauren C! War Eagle!

What college are you in?
(Engineering/Business/Liberal Arts/Sciences/Agriculture/Education/Veterinary Medicine)
Sciences

What's your favorite Auburn sport?
(Football/Basketball/Baseball/Gymnastics/Other)
Gymnastics

---Your Auburn Connections---

From Auburn Sciences: E.O. Wilson - Pulitzer Prize winning biologist, "father of biodiversity"

Auburn Gymnastics legend: Simone Biles - Most decorated gymnast in history, 11 Olympic medals

Auburn Fun Fact:  Auburn has won two football national championships: 1957 and 2010.

War Eagle, Lauren C!

Resources: Used google to find syntax and options of awk, grep, and while and if loops

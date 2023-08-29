Holla Everyone !!

In this PROJECT, I have used bash script to automate the task. I have used quotes.txt to store my quotes. The bash script is give in this folder, Check it out.
I have also used this script to run automatically whenever i reopen my bash terminal, So that it can give me RANDOM quotes.
>> I have done this by including my script, and running it in .bashrc file which is present in HOME directory.
	This is done by includeing the below command in .bashrc file.
		bash ~/randomquotes.sh
	NOTE: THis randomquotes.sh should be present in ~(home) directory.

		By doing so, Whenever there is non-login shell generation i.e bash is opened, this script get executed.


**Prerequisites:**

Bash Scripting.
Use of common commands.


Working:

-> Firstly, in the bash script i have stored all my quotes in an array. By doing so i can fetch each quotes seperately.
-> Then i have used echo command, which is used to print message.
-> To print the array elements, I have used built-in command called RANDOM. This command helps us in picking up a random number by default.
-> I'm printing the random quotes, so i have updated the expression as RANDOM%(number of lines of quotes).
-> Since I'm using array, i have to print like 
			echo ${arr[$RANDOM%(no. of lines)]}
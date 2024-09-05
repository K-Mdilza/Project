=> Structures:
	LEDSettings: Holds the state, brightness, and color for an individual LED.
	LEDGroup: Encapsulates an LEDSettings structure for an individual LED along with group settings like state and brightness.

=> Functions:
	initLEDGroup(): Initializes the LED group with default values.
	updateLEDGroupSettings(): Updates the individual LED and group settings.
	displayLEDGroupStatus(): Prints the current settings of the individual LED and the group.

Compilation and Testing:
1) Compiling: To compile the program, use a standard C compiler. I have used GCC compiler.  For embedded development, this would typically be done in an IDE like MPLAB X for PIC microcontrollers.
Simply use gcc *.c command in terminal to compile all .c files, after that you have a executable file.
2) Testing: The program can be tested by running the compiled binary [a.out] in a console or on the microcontroller itself. It should display the initial and updated status of the LED group.

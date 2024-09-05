#include "led.h"

int main() {
    LED_group gp; // Creating a variable of LED_group type.
    initLEDGroup(&gp); // Initialize with default values.
    
    displayLEDGroupStatus(&gp); // Display the status of LEDs.
    
    updateLEDGroupSettings(&gp,1,200,1,100,0XFFFFFFFF); // Updating the LEDs with the values given in the argument.
    
    displayLEDGroupStatus(&gp);

    return 0;
}

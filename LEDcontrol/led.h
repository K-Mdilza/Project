#include <stdio.h>

/* Using Typedef inorder to access the existing type with a different name */
typedef unsigned char uint8_t; // Stores 1byte.
typedef unsigned int uint32_t; // Stores 4byte.

/* Structure for Individual LED's settings */
typedef struct LEDSettings{
    /* state represent the LED state On/OFF,
       brightness represent the brightness of LED,
       color represent the color of LED. */
       
    uint8_t state;
    uint8_t brightness;
    uint32_t color;
}LED_set;

/* Structure for group LED's */
typedef struct LEDGroup{
    /* singleLED represents the pointer pointing to individual led's,
       groupState is the status of group LED's ON/OFF,
       groupBrightness is the brightness of group led's. */
       
    LED_set *singleLED;
    uint8_t groupState;
    uint8_t groupBrightness;
}LED_group;


/* Function Prototypes */
void initLEDGroup(LED_group *);
void updateLEDGroupSettings(LED_group *, uint8_t, uint8_t, uint8_t, uint8_t, uint32_t);
void displayLEDGroupStatus(const LED_group *);

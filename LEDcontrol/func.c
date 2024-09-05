#include "led.h"

/* Function to initialize LED group with default values */
void initLEDGroup(LED_group *group){
    group->singleLED->state = group->singleLED->brightness = group->singleLED->color = 0;
    group->groupState = 0;
    group->groupBrightness = 0;
}

/* Function to update group led's with the values provided */
void updateLEDGroupSettings(LED_group *group, uint8_t groupState, uint8_t groupBrightness, uint8_t state, uint8_t brightness, uint32_t color){
    group->groupState = groupState;
    group->groupBrightness = groupBrightness;
    group->singleLED->state = state;
    group->singleLED->brightness = brightness;
    group->singleLED->color = color;
}

/* Function to display everything of a group LEDs data members */
void displayLEDGroupStatus(const LED_group *group){
    printf("\tIndividual LED Status:\n");
    printf("State: %s\n", group->singleLED->state ? "ON" : "OFF");
    printf("Brightness: %u\n", group->singleLED->brightness);
    printf("Color: #%08X\n", group->singleLED->color);
    printf("\tGroup Status:\n");
    printf("Group State: %s\n", group->groupState ? "All ON" : "All OFF");
    printf("Group Brightness: %u\n\n", group->groupBrightness);
}


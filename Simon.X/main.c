/*
 * File:   main.c
 * Author: hehahohee
 *
 * Created on November 6, 2012, 3:29 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "/Users/hehahohee/Documents/SE102/CD stuff/code/include/pic24_all.h"

/// LED BLUE
#define CONFIG_LEDB() CONFIG_RB14_AS_DIG_OUTPUT()
#define LEDB  _LATB14     //blue LED state

/// LED RED
#define CONFIG_LEDR() CONFIG_RB13_AS_DIG_OUTPUT()
#define LEDR _LATB13     // red LED state

/// LED YELLOW
#define CONFIG_LEDY() CONFIG_RB12_AS_DIG_OUTPUT()
#define LEDY _LATB12     // yellow LED state

/// LED GREEN
#define CONFIG_LEDG() CONFIG_RB9_AS_DIG_OUTPUT()
#define LEDG _LATB9

inline void configLEDs(){
    CONFIG_LEDB();
    CONFIG_LEDR();
    CONFIG_LEDY();
    CONFIG_LEDG();
}

inline void configSwitches()  {
  CONFIG_RB2_AS_DIG_INPUT();     //use RB2 for blue switch input
  ENABLE_RB2_PULLUP();           //enable the pullup
  CONFIG_RB3_AS_DIG_INPUT();     //use RB2 for red switch input
  ENABLE_RB3_PULLUP();           //enable the pullup
  CONFIG_RB4_AS_DIG_INPUT();     //use RB2 for yellow switch input
  ENABLE_RB4_PULLUP();           //enable the pullup
  CONFIG_RB5_AS_DIG_INPUT();     //use RB2 for green switch input
  ENABLE_RB5_PULLUP();           //enable the pullup

}

#define SWB              _RB2       //switch state
#define SWR              _RB3       //switch state
#define SWY              _RB4       //switch state
#define SWG              _RB5       //switch state
#define PRESSED 0 // hardware is configured so that button press is low input

#define MAX_SIZE 6
#define MAX_TEMPO 240
#define TEMPO_INC 60

#define BLUE 0
#define RED 1
#define YELLOW 2
#define GREEN 3

void test();

//Generates a pattern of a given size and places it in the array
void generatePattern(uint8 a[], uint8 b);

// display the pattern given by the array with the given tempo
void displayPattern(uint8 pattern[], uint8 size, uint16 tempo);

// get input
uint8 testPattern(uint8 pattern[], uint8 size);

// the actual game
void game(void);

// does something to indicate success
void success();

// does something to indicate failure
void failure();

/*
 *
 */

int main(void){
    configClock();
    configSwitches();
    configLEDs();

    while (1)
        game();
}

void game (void) {
    uint8 pattern [MAX_SIZE] = {0};
    uint16 tempo = 90; //tempo in BPM
    uint8 size;

    DELAY_MS(2000);
    while(tempo < MAX_TEMPO)
    {
        for(size = 1; size <= MAX_SIZE; size++){
            generatePattern(pattern, size);
            displayPattern(pattern, size, tempo);
            if(testPattern(pattern, size))
                success();
            else{
                failure();
                size--; // repeat this difficulty level
            }
        }
        tempo += TEMPO_INC;
    }
}

void test()
{
    LEDB = 0;            //LED off initially
    LEDR = 0;
    LEDY = 0;
    LEDG = 0;

    while (1) {
        if (SWB == PRESSED)
            LEDB = 1;
        else
            LEDB = 0;
        if (SWR == PRESSED)
            LEDR = 1;
        else
            LEDR = 0;
        if (SWY == PRESSED)
            LEDY = 1;
        else
            LEDY = 0;
        if(SWG == PRESSED)
            LEDG = 1;
        else
            LEDG = 0;
  }
}

void generatePattern(uint8 pattern[], uint8 size)
{
    int i;
    for(i = 0; i < size ;i++)
    {
        pattern[i]=(rand()%4);
    }
}

// display the pattern given by the array with the given tempo
void displayPattern(uint8 pattern[], uint8 size, uint16 tempo){
    int delaytime = 60000/tempo;
    int i;
    for (i = 0; i < size; i++){
        switch(pattern[i]){
            case BLUE:
                LEDB = 1;
                DELAY_MS(delaytime);
                LEDB = 0;
                break;
            case YELLOW:
                LEDY = 1;
                DELAY_MS(delaytime);
                LEDY = 0;
                break;
            case RED:
                LEDR = 1;
                DELAY_MS(delaytime);
                LEDR = 0;
                break;
            case GREEN:
                LEDG = 1;
                DELAY_MS(delaytime);
                LEDG = 0;
                break;
        }
        DELAY_MS(delaytime);
    }
}

// get input
uint8 testPattern(uint8 pattern[], uint8 size){
    int i = 0;
    for (i = 0; i < size; i++){
        // wait for input
        while(SWB != PRESSED && SWR != PRESSED && SWY!= PRESSED && SWG != PRESSED); 
        DELAY_MS(15); // debounce
        if(SWB == PRESSED){
            while(SWB == PRESSED)
                LEDB = 1; // wait for release
            DELAY_MS(15);//debounce
            LEDB = 0;
            if(pattern[i] == BLUE)
                continue;
            else
                return 0; // false
        }
        if(SWR == PRESSED){
            while(SWR == PRESSED)
                LEDR = 1; // wait for release
            DELAY_MS(15);//debounce
            LEDR = 0;
            if(pattern[i] == RED)
                continue;
            else
                return 0;
        }
        if(SWY == PRESSED){
            while(SWY == PRESSED)
                LEDY = 1; // wait for release
            DELAY_MS(15);//debounce
            LEDY = 0;
            if(pattern[i] == YELLOW)
                continue;
            else
                return 0;
        }
        if (SWG == PRESSED){
            while(SWG == PRESSED)
                LEDG = 1; // wait for release
            DELAY_MS(15);//debounce
            LEDG = 0;
            if(pattern[i] == GREEN)
                continue;
            else
                return 0;
        }
    }
    return 1; // success
}

// does something to indicate success
void success(){
// if success lights will blink
    int i;
    for(i =0;i<2;i++)
    {
        LEDG=1;
        LEDY=1;
        LEDR=1;
        LEDB=1;
        DELAY_MS(100);
        LEDG=0;
        LEDY=0;
        LEDR=0;
        LEDB=0;
        DELAY_MS(100);
    }
}

// does something to indicate failure
void failure(){
// if fails, lights will dance
    int c;

    for(c=0; c<2; c++)
    {
    //forward
        LEDG = 1;
        DELAY_MS(100);

        LEDG = 0;
        LEDY = 1;
        DELAY_MS(100);

        LEDY = 0;
        LEDR = 1;
        DELAY_MS(100);

        LEDR = 0;
        LEDB = 1;
        DELAY_MS(100);

        LEDB = 0;
    //reverse
        LEDB = 1;
        DELAY_MS(100);

        LEDB = 0;
        LEDR = 1;
        DELAY_MS(100);

        LEDR = 0;
        LEDY = 1;
        DELAY_MS(100);

        LEDY = 0;
        LEDG = 1;
        DELAY_MS(100);
        LEDG=0;
    }
}
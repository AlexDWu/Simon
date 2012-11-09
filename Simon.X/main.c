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
#define SWB_PRESSED()   SWB==0  //switch test
#define SWB_RELEASED()  SWB==1  //switch test
#define SWR              _RB3       //switch state
#define SWR_PRESSED()   SWR==0  //switch test
#define SWR_RELEASED()  SWR==1  //switch test
#define SWY              _RB4       //switch state
#define SWY_PRESSED()   SWY==0  //switch test
#define SWY_RELEASED()  SWY==1  //switch test
#define SWG              _RB5       //switch state
#define SWG_PRESSED()   SWG==0  //switch test
#define SWG_RELEASED()  SWG==1  //switch test

#define MAX_SIZE 8
#define MAX_TEMPO 240
#define TEMPO_INC 30

#define BLUE 0;
#define RED 1;
#define YELLOW 2;
#define GREEN 3;

void test();

//Generates a pattern of a given size and places it in the array
void generatePattern(uint8[], uint8);

// display the pattern given by the array with the given tempo
void displayPattern(uint8[], uint8, uint16);

// get input
uint8 testPattern(uint8[], uint8);

// does something to indicate success
void success();

// does something to indicate failure
void failure();

/*
 * 
 */
int main (void) {
    uint8 pattern [MAX_SIZE] = {0};
    uint16 tempo = 30; //tempo in BPM

    configClock();
    configSwitches();        //configure switches
    configLEDs();       //configure LED

    while(tempo < MAX_TEMPO)
    {
        for(uint8 size = 1; size <= MAX_SIZE; size++){
            generatePattern(pattern, size);
            displayPattern(pattern, size, tempo);
            if(testPattern(pattern, size))
                success();
            else
                failure();
        }
        tempo += TEMPO_INC;
    }

    return 0;
}

void test()
{
    LEDB = 0;            //LED off initially
    LEDR = 0;
    LEDY = 0;
    LEDG = 0;

    while (1) {
        if (SWB_PRESSED())
            LEDB = 1;
        else
            LEDB = 0;
        if (SWR_PRESSED())
            LEDR = 1;
        else
            LEDR = 0;
        if (SWY_PRESSED())
            LEDY = 1;
        else
            LEDY = 0;
        if(SWG_PRESSED())
            LEDG = 1;
        else
            LEDG = 0;
  }    
}
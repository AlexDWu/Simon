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

#define SWB              _RB2       //Blue switch state
#define SWR              _RB3       //Red switch state
#define SWY              _RB4       //Yellow switch state
#define SWG              _RB5       //Green switch state
#define PRESSED 0 // hardware is configured so that button press is low input

// Game settings
#define MAX_SIZE 32
#define START_TEMPO 90
#define MAX_TEMPO 480
#define TEMPO_INC 60

#define BLUE 0
#define RED 1
#define YELLOW 2
#define GREEN 3

#define SOUNDOUT _LATB6
inline void configSound(){
    CONFIG_RB6_AS_DIG_OUTPUT();
}

// Tones for the colours (ADF#A - true tones :)
#define GREEN_SOUND	440
#define RED_SOUND	370
#define YELLOW_SOUND	294
#define BLUE_SOUND	220
#define FAIL_SOUND      164

void soundOn(uint16 freq);

void soundOff();

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
    configSound();

    while (1){
        // press any button to start
        while(SWB != PRESSED && SWR != PRESSED && SWY!= PRESSED && SWG != PRESSED);
        DELAY_MS(15); // debounce
        game();
    }

    

}

void game (void) {
    uint8 pattern [MAX_SIZE] = {0};
    uint16 tempo = START_TEMPO; //tempo in BPM
    uint8 size;

    for(size = 1; size <= MAX_SIZE;)
    {
        
        generatePattern(pattern, size);
        displayPattern(pattern, size, tempo);
        if(testPattern(pattern, size)){
            success();
            size++; // advance to next difficulty level
            if(size % 6 == 0) // if pattern size is larger
                tempo += TEMPO_INC; // increase tempo
        }
        else{
            failure();
            // repeat this difficulty level
        }
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
                soundOn(BLUE_SOUND);
                DELAY_MS(delaytime);
                LEDB = 0;
                soundOff();
                break;
            case YELLOW:
                LEDY = 1;
                soundOn(YELLOW_SOUND);
                DELAY_MS(delaytime);
                LEDY = 0;
                soundOff();
                break;
            case RED:
                LEDR = 1;
                soundOn(RED_SOUND);
                DELAY_MS(delaytime);
                LEDR = 0;
                soundOff();
                break;
            case GREEN:
                LEDG = 1;
                soundOn(GREEN_SOUND);
                DELAY_MS(delaytime);
                LEDG = 0;
                soundOff();
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
            LEDB = 1; 
            soundOn(BLUE_SOUND);
            while(SWB == PRESSED); // wait for release                
            DELAY_MS(15);//debounce
            LEDB = 0;
            soundOff();
            if(pattern[i] == BLUE)
                continue;
            else
                return 0; // false
        }
        if(SWR == PRESSED){
            LEDR = 1;
            soundOn(RED_SOUND);    
            while(SWR == PRESSED); // wait for release
            DELAY_MS(15);//debounce
            LEDR = 0;
            soundOff();
            if(pattern[i] == RED)
                continue;
            else
                return 0;
        }
        if(SWY == PRESSED){
            LEDY = 1;
            soundOn(YELLOW_SOUND);
            while(SWY == PRESSED); // wait for release
            DELAY_MS(15);//debounce
            LEDY = 0;
            soundOff();
            if(pattern[i] == YELLOW)
                continue;
            else
                return 0;
        }
        if (SWG == PRESSED){
            LEDG = 1;
            soundOn(GREEN_SOUND);
            while(SWG == PRESSED); // wait for release
            DELAY_MS(15);//debounce
            LEDG = 0;
            soundOff();
            if(pattern[i] == GREEN)
                continue;
            else
                return 0;
        }
    }
    return 1; // success
}

// does something to indicate failure
void failure(){
// if success lights will blink
    int i;
    soundOn(FAIL_SOUND);
    for(i =0;i<4;i++)
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
    soundOff();
    DELAY_MS(500);
}

// does something to indicate failure
void success(){
// if success, lights will dance
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

// turns on sound
void soundOn(uint16 freq){
    T2CON = T2_OFF | T2_IDLE_CON | T2_GATE_OFF
            | T2_32BIT_MODE_OFF
            | T2_SOURCE_INT
            | T2_PS_1_8;
    PR2 = usToU16Ticks(500000/freq, getTimerPrescale(T2CONbits)) - 1;
    TMR2 = 0;   // clear timer2 value
    _T2IF = 0;  // clear interrupt flag
    _T2IP = 7;  // high priority for quality sound
    _T2IE = 1;  // enable interupt
    T2CONbits.TON = 1; // Turn on the timer

}

void _ISRFAST _T2Interrupt(){
    SOUNDOUT =! SOUNDOUT; // toggle output
    _T2IF = 0; // clear interupt bit
}

void soundOff(){
    _T2IE = 0; // disable interupt
    T2CONbits.TON = 0; // Turn off timer
    SOUNDOUT = 0; // make sure port is low
}
#include "led_blink.h"

#define LED_STAND_PIN 13

static unsigned long time = 0;
static unsigned long DELAY = 100000;
static bool on = false;


void setup()
{
    pinMode(LED_STAND_PIN, OUTPUT);
}

void loop()
{
    if ( micros() >= time + DELAY ) {
        time = micros();
        on = !on;
    }

    uint8_t state = on ? HIGH : LOW;

    digitalWrite(LED_STAND_PIN, state);
}

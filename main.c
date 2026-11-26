#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <stdint.h>

void buzzer_init(void)
{
    DDRB  |= (1 << PB2);                    // PB1 (OC1A) som output
    TCCR1A = 0;
    TCCR1B = (1 << WGM12) | (1 << CS11);    // CTC-tilstand, prescaler 8
}

// f = frekvens i Hz. 0 = stilhed.
void buzzer_tone(uint16_t f)
{
    if (f == 0) {
        TCCR1A &= ~(1 << COM1A0);           // Afkobl timer fra pinnen
        PORTB  &= ~(1 << PB2);              // Hold pinnen lav
    } else {
        OCR1A  = (F_CPU / (2UL * 8UL * f)) - 1;
        TCCR1A |= (1 << COM1A0);            // Toggle OC1A ved compare match
    }
}
int main(void)
{
    buzzer_init();
    buzzer_tone(20000);   // 2 kHz i 500 ms
    _delay_ms(500);
    buzzer_tone(0);      // stilhed
    while (1) {}
}

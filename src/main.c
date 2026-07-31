#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

// Define Bit Positions
#define BIT_SYSTEM_READY  0
#define BIT_SENSOR_ACTIVE 1
#define BIT_ERROR_FLAG    2
#define BIT_DATA_AVAILABLE 3

volatile uint32_t STATUS_REG = 0;


void set_bit(uint32_t *reg, uint8_t bit_pos) {
    uint32_t bit_to_set = 1U<<bit_pos;
    *reg |= bit_to_set;
}

void clear_bit(uint32_t *reg, uint8_t bit_pos) {
    uint32_t bit_to_clear = 1U<<bit_pos;
    *reg &= ~bit_to_clear;
}

void toggle_bit(uint32_t *reg, uint8_t bit_pos) {
    uint32_t bit_to_toggle = 1U<<bit_pos;
    *reg ^= bit_to_toggle;
}

bool is_bit_set(uint32_t reg, uint8_t bit_pos) {
    uint32_t num = (reg>>bit_pos)&1U;
    if(num){
        return true;
    }
    return false;
}

// Function to print a 32-bit number in binary format so you can see it!
void print_binary(uint32_t num) {
    printf("Register Value: 0x%08X | Binary: ", num);
    for (int i = 31; i >= 0; i--) {
        uint32_t mask = 1U << i;
        printf("%c", (num & mask) ? '1' : '0');
        if (i % 4 == 0) printf(" "); // Space every 4 bits
    }
    printf("\n");
}

void Interrupt_Handler(void) {
    // Hardware sets DATA_AVAILABLE and clears SENSOR_ACTIVE
    set_bit((uint32_t *)&STATUS_REG, BIT_DATA_AVAILABLE);
    clear_bit((uint32_t *)&STATUS_REG, BIT_SENSOR_ACTIVE);
}

int main() {
    set_bit((uint32_t *)&STATUS_REG, BIT_SENSOR_ACTIVE);
    printf("Sensor activated. Waiting for hardware data...\n");
    Interrupt_Handler();

    while (!is_bit_set(STATUS_REG, BIT_DATA_AVAILABLE)) {
        // Waiting...
    }

    printf("Data received successfully!\n");
    return 0;
}
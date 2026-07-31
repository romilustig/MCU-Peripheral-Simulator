#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

// Define Bit Positions
#define BIT_SYSTEM_READY  0
#define BIT_SENSOR_ACTIVE 1
#define BIT_ERROR_FLAG    2


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

int main() {
    uint32_t status_register = 0x0; // Start with all bits 0

    printf("--- INITIAL STATE ---\n");
    print_binary(status_register);

    printf("\n--- SETTING SYSTEM_READY (Bit 0) ---\n");
    set_bit(&status_register, BIT_SYSTEM_READY);
    print_binary(status_register);

    printf("\n--- SETTING ERROR_FLAG (Bit 2) ---\n");
    set_bit(&status_register, BIT_ERROR_FLAG);
    print_binary(status_register);

    printf("\n--- CLEARING SYSTEM_READY (Bit 0) ---\n");
    clear_bit(&status_register, BIT_SYSTEM_READY);
    print_binary(status_register);

    return 0;
}
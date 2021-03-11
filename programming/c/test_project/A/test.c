#include<stdio.h>

#define TRUE 1
#define FALSE 0
#define ATTR_ATTACK 0x11
#define ATTR_GUARD 0x12

/*
 * This code may be a part of some games
 */

void set_attack(int *person);
void set_guard(int *person);
int is_attack(int *person);
int is_guard(int *person);

int
main(void) {

    /*
     * This is person object with no attribute
     */

    int person_init = 0;

    set_attack(&person_init);
    set_guard(&person_init);

    /* 
     * Check for attack attrbute
     */

    if (is_attack(&person_init)) {
        printf("Attack attrbute was set\n");
    } else {
        printf("Attack attribute not set yet\n");
    }

    /*
     * Check for guard attrbute
     */

    if (is_guard(&person_init)) {
        printf("Guard attrbute was set\n");
    } else {
        printf("Guard attrbute not set yet\n");
    }
}

void
set_attack(int *person) {
    (*person) &= ATTR_ATTACK;
}

void
set_guard(int *person) {
    (*person) &= ATTR_GUARD;
}

int
is_attack(int *person) {
    if (((*person) & ATTR_ATTACK) == ATTR_ATTACK)
        return TRUE;
    return FALSE;
}

int
is_guard(int *person) {
    if (*person | ATTR_GUARD)
        return TRUE;
    return FALSE;
}

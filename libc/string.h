#ifndef STRING_H
#define STRING_H

#include "../cpu/types.h"

void int_to_ascii(int n, char str[]);
void reverse(char str[]);
int strlen(char str[]);
void backspace(char str[]);
void append(char str[], char letter);
int strcmp(char s1[], char s2[]);
void hex_to_ascii(int n, char str[]);


#endif

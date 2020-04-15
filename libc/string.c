#include "string.h"

void int_to_ascii(int n, char str[]) {
    int i, sign;
    if ((sign = n) < 0) n = -n;
    i = 0;
    do {
        str[i++] = n % 10 + '0';
    } while ((n /= 10) > 0);

    if (sign < 0) str[i++] = '-';
    str[i] = '\0';

    reverse(str);
}

void reverse(char str[]) {
    int c, i, j;
    for(i=0, j = strlen(str) - 1; i<j; i++, j--) {
        c = str[i];
        str[i] = str[j];
        str[j] = c;
    }
}

int strlen(char str[]) {
    int i = 0;
    while(str[i] != '\0') ++i;
    return i;
}

void append(char str[], char ch) {
    int len = strlen(str);

    str[len] = ch;
    str[len + 1] = '\0';
}

void backspace(char str[]) {
    int len = strlen(str);
    str[len-1] = '\0';
}

int strcmp(char str1[], char str2[]) {
    int i;
    for(i=0; str1[i] == str2[i]; ++i) {
        if(str1[i] == '\0') {
            return 0;
        }
    }

    return str1[i] - str2[i];
}
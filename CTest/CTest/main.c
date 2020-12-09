#include <stdio.h>

int main(int argc, const char *argv[]) {
    
}

int getOpPrec(char op) {
    switch (op) {
        case '*':
        case '/':
            return 5;
        case '+':
        case '-':
            return 3;
    }
    
    return -1;
}

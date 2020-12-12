#include <stdio.h>
#include <unistd.h>
#include "InfixToPostfix.h"

int main(int argc, const char *argv[]) {
    char exp1[] = "1+2*3*4";
    
    convToRPNExp(exp1);
    
    printf("%s\n", exp1);
}

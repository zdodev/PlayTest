#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "InfixToPostfix.h"

int main(int argc, const char *argv[]) {
    int pid = 0;
    
    pid = fork();
    
    if (pid < 0) {
        fprintf(stderr, "Fork Failed");
        exit(1);
    } else if (pid == 0) {
        execlp("/bin/ls", "-l");
    } else {
        wait(NULL);
        printf("Child Complete");
    }
    
    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "InfixToPostfix.h"

int mod(char *S, int p) {
    // S는 수를 문자열로 표현한 것, 1324 -> "1324"
    int ret = 0;
    for (int i=0;S[i];i++) {
//        printf("%d %d\n", i, S[i]);
        ret = (ret*10 + (S[i]-'0')) % p;
        printf("%d\n", ret);
    }
    return ret;
}

int main(int argc, const char *argv[]) {
    mod("1324", 5);
    
    return 0;
}

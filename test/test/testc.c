//
//  testc.c
//  test
//
//  Created by zdo on 2020/11/28.
//

#include "testc.h"

long factorial(int n) {
    if (n == 0 || n == 1)
        return 1;
    else
        return n * factorial(n - 1);
}

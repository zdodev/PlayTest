func factorial(_ number: Int) -> Int {
    if number == 1 {
        return 1
    }
    return number * factorial(number - 1)
}

print(factorial(5))

func tailFactorial(_ number: Int, fac: Int) -> Int {
    if number == 1 {
        return fac
    }
    return tailFactorial(number - 1, fac: number * fac)
}

print(tailFactorial(5, fac: 1))

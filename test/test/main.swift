//
//  main.swift
//  test
//
//  Created by zdo on 2020/11/28.
//

import Foundation

print("Hello \(factorial(5))")

func sapi(_ x: Int, arg: CVarArg...) -> Int {
    return withVaList(arg) { _ in
        factorial(Int32(x))
    }
}

print(sapi(4, arg: "nil"))

//https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/using_imported_c_functions_in_swift
//https://developer.apple.com/documentation/swift/cvararg

let array = [1, 2, 3, 4, 5]
let multiplication = array.map {
    $0 + 1
}
print(multiplication)

let array1 = [1, nil, 3, nil, 5, 6, 7]
let flatMapResult = array1.flatMap {
    $0
}
let compactMapResult = array1.compactMap {
    $0
}
print(flatMapResult)
print(compactMapResult)

let array2 = [[1, 2, 3], [nil, 5], [6, nil], [nil, nil]]
let flatMapResult2 = array2.flatMap {
    [1] + $0
}
let compactMapResult2 = array2.compactMap {
//    print($0)
    return $0
}
//print(flatMapResult2)
//print(compactMapResult2)

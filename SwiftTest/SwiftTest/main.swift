let arr = [1, 2, 3, 4, 5]
let map = arr.map {
    $0 * 2
}
print(map)

func add(sum: Int, count: Int) -> Int {
    var suma = sum
    suma += count
    if count > 0 {
        return add(sum: suma, count: count - 1)
    } else {
        return sum
    }
}

let result = arr.reduce(0) {
    print($0, $1)
    return $0 + $1
}
print(result)

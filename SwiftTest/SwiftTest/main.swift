let imperative = [1, 2, 3, 4, 5]
var result = [Int]()

for element in imperative {
    let double = element * 2
    result.append(double)
}
print(result)

let declarative = [1, 2, 3, 4, 5]

let result = declarative.map {
    $0 * 2
}
print(result)

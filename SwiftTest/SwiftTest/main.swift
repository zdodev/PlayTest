//func add(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
//    method(a, b)
//}
//
//
//func sub1(a: Int, b: Int) -> Int {
//    return a - b
//}
//
////var c: Int = 10
////c = 20
////c = 30
//
//func sub2(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
//    let c = 10
//    return a - b - c
//    return sub1(a: a, b: b)
//    return method(a, b)
//}

//print(sub2(a: 5, b: 3, method: sub1))

// 1번
let lowercaseAlphabets = ["a", "b", "c", "d", "e"]
let uppercaseAlphabets = lowercaseAlphabets.map {
    $0.uppercased()
}
print(uppercaseAlphabets)

// 2번
let responseMessages = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]
let responseCodes = responseMessages.map {
    $0.key
}
print(responseCodes)

// 3번
let products = ["iPhone 12 Pro", "iPhone 12 mini", "iPhone XS", "iPhone X", "iPhone SE"]
let productsContainX = products.filter {
    $0.contains("X")
}
print(productsContainX)

// 4번
let weatherInfos = ["Seoul": -6, "Gangneung": -3, "Daejeon": -3, "Busan": 0, "Jeju": 4]
var belowZeroLocations = weatherInfos.filter {
    $0.value < 0
}.map {
    $0.key
}
print(belowZeroLocations)

// 5번
let numbers1 = [11, 22, 33, 44, 55]
let numberSum = numbers1.reduce(0, +)
print(numberSum)

// 6번
let appleProductPrice = [
    "MacBook Pro 13 M1": 1_690_000,
    "iPad Air": 770_000,
    "Apple Pencil": 165_000,
    "iPhone 12 mini": 950_000,
    "Apple Watch 6": 539_000,
]
let discountedShoppingList = appleProductPrice.filter {
    $0.value > 700_000
}.reduce(0) { $0 + Int(Double($1.value) * 0.9) }
print(discountedShoppingList)

// 7번
let characterList = [
    "Dooly": 8,
    "Heedong": 4,
    "Michol": 30,
    "Kildong": 55
]
let underTwentyYearsOld = characterList.filter {
    $0.value < 20
}
print(underTwentyYearsOld)

// 8번
let numbers2 = ["1", "2", "three", "///4///", "5"]
let convertibleToInterger = numbers2.filter {
    guard let _ = Int($0) else {
        return false
    }
    return true
}
print(convertibleToInterger)

// 9번
let planets1 = ["Mercurius", "Venus", "Earth", "Mars", "Jupiter", "Saturnus", "Uranus", "Neptunus"]
let planetsStartingWithM = planets1.filter {
    $0.first == "M"
}
print(planetsStartingWithM)

// 10번
let planets2 = ["Mercurius", "Venus", "Earth", "Mars", "Jupiter", "Saturnus", "Uranus", "Neptunus"]
let planetWithTheLongestNameInPlanets = planets2.reduce("") {
    $0.count > $1.count ? $0 : $1
}
print(planetWithTheLongestNameInPlanets)

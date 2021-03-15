let array = [1, 3, 5, 7, 9]
let mapResult = array.map { element -> Int in
    if element == 3 {
        // 안되네
//        return
    }
    return element
}
print(mapResult)

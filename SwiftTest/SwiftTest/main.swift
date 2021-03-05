import Foundation

let a = true

func test() {
    guard a else {
        return
    }
    print("통과")
}

test()

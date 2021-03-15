# iOS & Swift test

---

### 클로저 중간에 종료하기

클로저 실행 중간에 특정 조건을 만족하면 종료하도록 하고 싶었는데 `return` 문으로는 종료가 되지 않는다.

```swift
let array = [1, 3, 5, 7, 9]
let mapResult = array.map { element -> Int in
    if element == 3 {
        // 안되네
//        return
    }
    return element
}
print(mapResult)
```





### 클로저에서 튜플을 파라미터로 선언하고 사용하기

```swift
func task1(_ doing: ((Int, Int), Int) -> Int) -> Int {
    doing((1, 2), 3)
}

let result1 = task1 { (a, b) -> Int in
    a.0 + a.1 + b
}

let result2 = task1 { a, b -> Int in
    a.0 + a.1 + b
}
```

튜플 파라미터 정의 시 괄호를 한번 더 명시하여 정의한다. 클로저 인자를 넘길 때 파라미터 부분을 괄호로 명시하거나 생략할 수 있습니다.



### 현재 시간 출력하기.

```swift
let since1970 = Date().timeIntervalSince1970
print(since1970)
// 1615219234.8159971

let sinceReferenceDate = Date().timeIntervalSinceReferenceDate
print(sinceReferenceDate)
// 636912034.816389

```



### UITextView 에서 개행별로 문자열 추출하기.

```swift
text.split(separator: "\u{2028}")
```



### 현재 시간 가져오기

```swift
let currentTime = Date().timeIntervalSince1970
```



### 메모리 주소 출력하기

```swift
withUnsafePointer(to: a) {
    print("value \(a) has address \($0)")
}
```


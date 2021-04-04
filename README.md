# iOS & Swift test

---

### Guard 문 조건문 판별

Guard 문은 조건문이 참일 때 계속 실행하고, 조건문이 거짓이면 else 구문을 실행하고 함수를 종료한다.

```swift
let name = "zdo"

func iDontKnowGuardStatement() {
    // 조건문이 true면 계속 실행.
    guard name == "zdo" else {
        return
    }
    
    print("guard")
}

func iReallyDontKnowGuardStatement() {
    // 조건문이 false이므로 조기 종료.
    guard name != "zdo" else {
        return
    }
    
    print("가드")
}

iDontKnowGuardStatement()
iReallyDontKnowGuardStatement()
// guard
```



### Navigation bar의 높이를 알 수 있을까? (feat. safeAreaLayoutGuide)

Navigation bar가 있는 뷰에 UI를 구성할 때 y축 위치를 view.y로 설정하면 navigation bar를 무시하고 화면 최상단에서부터 뷰를 배치하는 것을 볼 수 있습니다. 이러한 문제를 해결하기 위해서 `safeAreaLayoutGuide` 를 기준으로 제약을 설정하면 navigation bar 하단을 기준으로 레이아웃을 배치할 수 있습니다.

```swift
let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: greenView.bottomAnchor, multiplier: 1.0)
        ])
```



### TestCase를 작성하면서 알고리즘 문제 해결하기

TestCase를 작성하면서 알고리즘을 풀 수 있는 방식입니다. 입력을 테스트할 수 있으며, 입력이 주어지지 않은 경우에도 쉽게 테스트할 수 있습니다. 특히 예외, 반례 상황을 찾기에도 좋은 방식입니다.

```swift
// main.swift
import Foundation

struct Solution {
    func solution(_ number: Int) -> Int {
        number + 1
    }
}

struct TestCase {
    let testCase = [
        (1, 2),
        (2, 3)
    ]
}
```

각 테스트를 수행할 때 `map` 을 사용하였습니다. 테스트는 하나의 메소드에서 하나의 테스트만 수행하는 것이 원칙이지만 알고리즘 문제에 한해서 map을 사용해보는 것도 좋다고 생각했습니다.

```swift
// Tests.swift
import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func testQuotient() {
        _ = testCase.testCase.map { (input, output) in
            let result = solution.solution(input)
            XCTAssertEqual(output, result)
        }
    }
}
```



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


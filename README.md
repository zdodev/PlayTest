# iOS test

---

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


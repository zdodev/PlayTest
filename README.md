# iOS test

---

### 02.25 UITextView 에서 개행별로 문자열 추출하기.

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


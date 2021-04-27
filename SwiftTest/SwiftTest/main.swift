// Swift에서 부동소수점 소수점 자릿수 출력 조작하기

// String Formats를 사용하려면 Foundation을 가져와야 한다.
import Foundation

// 소수점 한 자릿수까지 표현하기
let dotOne = String(format: "%.1f", 0.123)
print("dotOne = \(dotOne)")
// dotOne = 0.1

// 소수점 두 자릿수까지 표현하기
let dotTwo = String(format: "%.2f", 0.123)
print("dotOne = \(dotTwo)")
// dotOne = 0.12

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

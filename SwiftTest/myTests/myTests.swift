//
//  myTests.swift
//  myTests
//
//  Created by Zero DotOne on 2021/01/10.
//

import XCTest

class myTests: XCTestCase {
    var solution: Solution!

    override func setUpWithError() throws {
        try super.setUpWithError()
        solution = Solution()
    }

    override func tearDownWithError() throws {
        solution = nil
        try super.tearDownWithError()
    }

    func testAlphabet() throws {
        var input: [Character] = ["h", "e", "l", "l", "o"]
        let output: [Character] = ["o", "l", "l", "e", "h"]
        let result = solution.reverseString(&input)
        XCTAssertEqual(result, output)
    }
    
    func testNumeric() throws {
        var input: [Character] = ["1", "3", "5", "7", "9", "8"]
        let output: [Character] = ["8", "9", "7", "5", "3", "1"]
        let result = solution.reverseString(&input)
        XCTAssertEqual(result, output)
    }
}

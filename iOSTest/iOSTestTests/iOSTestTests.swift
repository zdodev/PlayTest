import XCTest
@testable import iOSTest

class iOSTestTests: XCTestCase {
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    override func tearDown() {
        calculator = nil
        super.tearDown()
    }
    
    func testCalculatorAdd() {
        for _ in 1...10 {
            let integerRange = Int.min >> 1...Int.max >> 1
            let lhs = Int.random(in: integerRange)
            let rhs = Int.random(in: integerRange)
            let calculationResult = calculator.add(lhs, rhs)
            XCTAssertEqual(lhs + rhs, calculationResult)
        }
    }
    
    func testCalculatorSubtract() {
        for _ in 1...10 {
            let integerRange = Int.min >> 1...Int.max >> 1
            let lhs = Int.random(in: integerRange)
            let rhs = Int.random(in: integerRange)
            let calculationResult = calculator.subtract(lhs, rhs)
            XCTAssertEqual(lhs - rhs, calculationResult)
        }
    }
    
    func testCalculatorMultiply() {
        for _ in 1...10 {
            let integerRange = Int.min >> 32 - 1...Int.max >> 32 - 1
            let lhs = Int.random(in: integerRange)
            let rhs = Int.random(in: integerRange)
            let calculationResult = calculator.multiply(lhs, rhs)
            XCTAssertEqual(lhs * rhs, calculationResult)
        }
    }
    
    func testCalculatorDivide() {
        for _ in 1...10 {
            let integerRange = Int.min...Int.max
            let lhs = Int.random(in: integerRange)
            let rhs = Int.random(in: integerRange)
            let calculationResult = calculator.divide(lhs, rhs)
            XCTAssertEqual(lhs / rhs, calculationResult)
        }
    }
}

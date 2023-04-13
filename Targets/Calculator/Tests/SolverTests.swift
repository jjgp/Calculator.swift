import XCTest

@testable import Calculator

@MainActor
final class SolverTests: XCTestCase {
    func testInitialState() {
        let solver = Solver()

        // Should start as zero
        XCTAssertEqual(solver.display, "0")
    }

    func testDisplayAfterSendingDigits() throws {
        let solver = Solver()

        // Should remain zero
        try solver.send(.zero)
        XCTAssertEqual(solver.display, "0")

        // Should be 1
        try solver.send(.one)
        XCTAssertEqual(solver.display, "1")

        // Should be 12
        try solver.send(.two)
        XCTAssertEqual(solver.display, "12")

        // Should be 123 and etc...
        try solver.send(.three)
        XCTAssertEqual(solver.display, "123")
    }

    func testAddingADecimalWithZeroAsInteger() throws {
        let solver = Solver()

        // Should add the decimal
        try solver.send(.decimal)
        XCTAssertEqual(solver.display, "0.")

        // Should append a zero
        try solver.send(.zero)
        XCTAssertEqual(solver.display, "0.0")

        // Should append a zero
        try solver.send(.zero)
        XCTAssertEqual(solver.display, "0.00")

        // Should be 1
        try solver.send(.one)
        XCTAssertEqual(solver.display, "0.001")

        // Should be 12
        try solver.send(.two)
        XCTAssertEqual(solver.display, "0.0012")

        // Should be 123 and etc...
        try solver.send(.three)
        XCTAssertEqual(solver.display, "0.00123")
    }

    func testAddingADecimalWithAnInteger() throws {
        let solver = Solver()

        // Should be 1
        try solver.send(.one)
        XCTAssertEqual(solver.display, "1")

        // Should add the decimal
        try solver.send(.decimal)
        XCTAssertEqual(solver.display, "1.")

        // Should append a zero
        try solver.send(.zero)
        XCTAssertEqual(solver.display, "1.0")

        // Should append a zero
        try solver.send(.zero)
        XCTAssertEqual(solver.display, "1.00")

        // Should be 1
        try solver.send(.one)
        XCTAssertEqual(solver.display, "1.001")

        // Should be 12
        try solver.send(.two)
        XCTAssertEqual(solver.display, "1.0012")

        // Should be 123 and etc...
        try solver.send(.three)
        XCTAssertEqual(solver.display, "1.00123")
    }

    func testAddition() throws {
        let solver = Solver()

        try solver.send(.one)
        XCTAssertEqual(solver.display, "1")

        try solver.send(.add)
        XCTAssertEqual(solver.display, "1")

        try solver.send(.two)
        XCTAssertEqual(solver.display, "2")

        try solver.send(.add)
        XCTAssertEqual(solver.display, "3")

        try solver.send(.two)
        XCTAssertEqual(solver.display, "2")

        try solver.send(.equals)
        XCTAssertEqual(solver.display, "5")
    }

    func testValidDivision() throws {
        let solver = Solver()

        try solver.send(.one)
        XCTAssertEqual(solver.display, "1")

        try solver.send(.divide)
        XCTAssertEqual(solver.display, "1")

        try solver.send(.two)
        XCTAssertEqual(solver.display, "2")

        try solver.send(.divide)
        XCTAssertEqual(solver.display, "0.5")

        try solver.send(.two)
        XCTAssertEqual(solver.display, "2")

        try solver.send(.equals)
        XCTAssertEqual(solver.display, "0.25")
    }

    func testDivisionByZero() throws {}

    func testNegativeNumbers() throws {
        let solver = Solver()

        try solver.send(.one)
        XCTAssertEqual(solver.display, "1")

        try solver.send(.subtract)
        XCTAssertEqual(solver.display, "1")

        try solver.send(.two)
        XCTAssertEqual(solver.display, "2")

        try solver.send(.equals)
        XCTAssertEqual(solver.display, "-1")
    }

    func testMultiplication() throws {
        let solver = Solver()

        try solver.send(.two)
        XCTAssertEqual(solver.display, "2")

        try solver.send(.multiply)
        XCTAssertEqual(solver.display, "2")

        try solver.send(.three)
        XCTAssertEqual(solver.display, "3")

        try solver.send(.equals)
        XCTAssertEqual(solver.display, "6")

        try solver.send(.multiply)
        XCTAssertEqual(solver.display, "6")

        try solver.send(.zero)
        XCTAssertEqual(solver.display, "0")

        try solver.send(.equals)
        XCTAssertEqual(solver.display, "0")
    }

    func testSignChange() throws {
        // TODO:
    }

    func testPercentage() throws {
        // TODO:
    }

    func testAllClearResetsStateToZero() throws {
        let solver = Solver()

        try solver.send(.two)
        XCTAssertEqual(solver.display, "2")

        try solver.send(.allClear)
        XCTAssertEqual(solver.display, "0")

        try solver.send(.multiply)
        XCTAssertEqual(solver.display, "0")

        try solver.send(.eight)
        XCTAssertEqual(solver.display, "8")

        try solver.send(.equals)
        XCTAssertEqual(solver.display, "0")
    }

    func testClearResetsOperandAndNotSubtotal() throws {
        // TODO:
    }
}

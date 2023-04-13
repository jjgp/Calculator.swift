import XCTest

@testable import Calculator

@MainActor
final class SolverTests: XCTestCase {
    func testDisplayAfterSendingDigits() throws {
        let solver = Solver()

        // Should start as zero
        XCTAssertEqual(solver.display, "0")

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

    func testAddingADecimal() throws {
        let solver = Solver()

        // Should start as zero
        XCTAssertEqual(solver.display, "0")

        // Should remain zero
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

    func testDivisionByZero() throws {}

    func testValidDivision() throws {}

    func testMultiplication() throws {}

    func testSignChange() throws {}

    func testPercentage() throws {}

    func testAllClearResetsStateToZero() throws {}
}

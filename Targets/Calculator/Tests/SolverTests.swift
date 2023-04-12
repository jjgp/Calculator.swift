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
        try solver.send(.two)
        XCTAssertEqual(solver.display, "123")
    }

    func testAddingADecimal() throws {
        // Note zero is valid again
    }

    func testAddition() throws {}

    func testDivisionByZero() throws {}

    func testValidDivision() throws {}

    func testMultiplication() throws {}

    func testSignChange() throws {}

    func testPercentage() throws {}

    func testAllClearResetsStateToZero() throws {}
}

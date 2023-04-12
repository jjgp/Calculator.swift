import XCTest

@testable import Calculator

@MainActor
final class EngineTests: XCTestCase {
    func testDisplayAfterSendingDigits() throws {
        let engine = Engine()

        // Should start as zero
        XCTAssertEqual(engine.display, "0")

        // Should remain zero
        try engine.send(.zero)
        XCTAssertEqual(engine.display, "0")

        // Should be 1
        try engine.send(.one)
        XCTAssertEqual(engine.display, "1")

        // Should be 12
        try engine.send(.two)
        XCTAssertEqual(engine.display, "12")

        // Should be 123 and etc...
        try engine.send(.two)
        XCTAssertEqual(engine.display, "123")
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

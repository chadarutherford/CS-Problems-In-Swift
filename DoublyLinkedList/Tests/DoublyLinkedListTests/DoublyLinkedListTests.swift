import XCTest
@testable import DoublyLinkedList

final class DoublyLinkedListTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DoublyLinkedList().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

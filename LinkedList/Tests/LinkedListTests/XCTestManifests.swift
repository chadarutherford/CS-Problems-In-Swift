import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(StackTests.allTests),
		testCase(QueueTests.allTests)
    ]
}
#endif

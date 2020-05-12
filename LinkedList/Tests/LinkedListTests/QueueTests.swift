import XCTest
@testable import LinkedList

final class QueueTests: XCTestCase {
	
	func testCountReturns0ForEmptyLLQueue() {
		let queue = LinkedListQueue<Int>()
		XCTAssertEqual(queue.count(), 0)
	}
	
	func testCountReturns0ForEmptyArrayQueue() {
		let queue = ArrayQueue<Int>()
		XCTAssertEqual(queue.count(), 0)
	}
	
	func testCountReturnsCorrectLengthAfterLLEnqueue() {
		let queue = LinkedListQueue<Int>()
		XCTAssertEqual(queue.count(), 0)
		queue.enqueue(2)
		XCTAssertEqual(queue.count(), 1)
		queue.enqueue(4)
		XCTAssertEqual(queue.count(), 2)
		queue.enqueue(6)
		queue.enqueue(8)
		queue.enqueue(10)
		queue.enqueue(12)
		queue.enqueue(14)
		queue.enqueue(16)
		queue.enqueue(18)
		XCTAssertEqual(queue.count(), 9)
	}
	
	func testCountReturnsCorrectLengthAfterArrayEnqueue() {
		let queue = ArrayQueue<Int>()
		XCTAssertEqual(queue.count(), 0)
		queue.enqueue(2)
		XCTAssertEqual(queue.count(), 1)
		queue.enqueue(4)
		XCTAssertEqual(queue.count(), 2)
		queue.enqueue(6)
		queue.enqueue(8)
		queue.enqueue(10)
		queue.enqueue(12)
		queue.enqueue(14)
		queue.enqueue(16)
		queue.enqueue(18)
		XCTAssertEqual(queue.count(), 9)
	}
	
	func testEmptyLLDequeue() {
		let queue = LinkedListQueue<Int>()
		XCTAssertNil(queue.dequeue())
		XCTAssertEqual(queue.count(), 0)
	}
	
	func testEmptyArrayDequeue() {
		let queue = ArrayQueue<Int>()
		XCTAssertNil(queue.dequeue())
		XCTAssertEqual(queue.count(), 0)
	}
	
	func testDequeueRespectsLLOrder() {
		let queue = LinkedListQueue<Int>()
		queue.enqueue(100)
		queue.enqueue(101)
		queue.enqueue(105)
		XCTAssertEqual(queue.dequeue(), 100)
		XCTAssertEqual(queue.count(), 2)
		XCTAssertEqual(queue.dequeue(), 101)
		XCTAssertEqual(queue.count(), 1)
		XCTAssertEqual(queue.dequeue(), 105)
		XCTAssertEqual(queue.count(), 0)
		XCTAssertNil(queue.dequeue())
		XCTAssertEqual(queue.count(), 0)
	}
	
	func testDequeueRespectsArrayOrder() {
		let queue = ArrayQueue<Int>()
		queue.enqueue(100)
		queue.enqueue(101)
		queue.enqueue(105)
		XCTAssertEqual(queue.dequeue(), 100)
		XCTAssertEqual(queue.count(), 2)
		XCTAssertEqual(queue.dequeue(), 101)
		XCTAssertEqual(queue.count(), 1)
		XCTAssertEqual(queue.dequeue(), 105)
		XCTAssertEqual(queue.count(), 0)
		XCTAssertNil(queue.dequeue())
		XCTAssertEqual(queue.count(), 0)
	}
}

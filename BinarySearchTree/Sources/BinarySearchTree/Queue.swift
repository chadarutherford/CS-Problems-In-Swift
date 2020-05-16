//
//  Queue.swift
//  
//
//  Created by Chad Rutherford on 5/11/20.
//

import Foundation

public class ArrayQueue<T> {
	public var size: Int
	public var storage: [T]
	
	public init() {
		self.size = 0
		self.storage = []
	}
	
	public func count() -> Int {
		return self.storage.count
	}
	
	public func enqueue(_ value: T) {
		self.storage.append(value)
	}
	
	public func dequeue() -> T? {
		return self.storage.count > 0 ? self.storage.removeFirst() : nil
	}
}

public class LinkedListQueue<T: Comparable> {
	public var size: Int
	public var storage: DoublyLinkedList<T>
	
	public init() {
		self.size = 0
		self.storage = DoublyLinkedList<T>()
	}
	
	public func count() -> Int {
		return self.size
	}
	
	public func enqueue(_ value: T) {
		self.storage.addToTail(value)
		self.size += 1
	}
	
	public func dequeue() -> T? {
		if self.storage.head == nil {
			return nil
		} else {
			self.size -= 1
			return self.storage.removeFromHead()
		}
	}
}

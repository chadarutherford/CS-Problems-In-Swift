//
//  Stack.swift
//  
//
//  Created by Chad Rutherford on 5/11/20.
//

import Foundation

class ArrayStack<T> {
	var size: Int
	var storage: [T]
	
	init() {
		self.size = 0
		self.storage = []
	}
	
	func count() -> Int {
		return self.storage.count
	}
	
	func push(_ value: T) {
		self.storage.append(value)
	}
	
	func pop() -> T? {
		return self.storage.count > 0 ? self.storage.removeLast() : nil
	}
}

class LinkedListStack<T: Comparable> {
	var size: Int
	var storage: DoublyLinkedList<T>
	
	init() {
		self.size = 0
		self.storage = DoublyLinkedList<T>()
	}
	
	func count() -> Int {
		return self.size
	}
	
	func push(_ value: T) {
		self.storage.addToTail(value)
		self.size += 1
	}
	
	func pop() -> T? {
		if self.storage.head == nil {
			return nil
		} else {
			self.size -= 1
			return self.storage.removeFromTail()
		}
	}
}

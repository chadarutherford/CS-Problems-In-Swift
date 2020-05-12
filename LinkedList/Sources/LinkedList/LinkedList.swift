import Foundation

public class Node<T> {
	public var value: T?
	public var next: Node?
	
	public init(_ value: T? = nil, _ next: Node? = nil) {
		self.value = value
		self.next = next
	}
	
	public func getValue() -> T? {
		return self.value
	}
	
	public func getNext() -> Node? {
		return self.next
	}
	
	public func setNext(_ node: Node) {
		self.next = node
	}
}

public class LinkedList<T> {
	public var head: Node<T>?
	public var tail: Node<T>?
	
	public init() {
		self.head = nil
		self.tail = nil
	}
	
	public func addToEnd(value: T) {
		let newNode = Node(value)
		if self.head == nil && self.tail == nil {
			self.head = newNode
			self.tail = newNode
		} else {
			self.tail?.setNext(newNode)
			self.tail = newNode
		}
	}
	
	public func addToHead(_ value: T) {
		let newNode = Node(value)
		if self.head == nil && self.tail == nil {
			self.head = newNode
			self.tail = newNode
		} else {
			newNode.setNext(self.head!)
			self.head = newNode
		}
	}
	
	public func removeFromHead() -> T? {
		if self.head == nil {
			return nil
		} else {
			let value = self.head?.getValue()
			self.head = self.head?.getNext()
			return value
		}
	}
	
	public func removeAtEnd() -> T? {
		var current = self.head
		if current == nil {
			return nil
		} else {
			var previous: Node<T>? = nil
			while current?.getNext() != nil {
				previous = current
				current = current?.getNext()
			}
			if previous != nil {
				self.tail = previous
				previous?.next = nil
			} else {
				self.head = nil
			}
			let value = current?.getValue()
			return value
		}
	}
}

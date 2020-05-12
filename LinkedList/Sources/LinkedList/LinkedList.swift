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
	
	public func setNext(node: Node) {
		self.next = node
	}
}

public class LinkedList<T> {
	public var head: Node<T>?
	
	public init() {
		self.head = nil
	}
	
	public func addToEnd(value: T) {
		let newNode = Node(value)
		if self.head == nil {
			self.head = newNode
		} else {
			var current = self.head
			while current?.getNext() != nil {
				current = current?.getNext()
			}
			current?.setNext(node: newNode)
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
				previous?.next = nil
			} else {
				self.head = nil
			}
			let value = current?.getValue()
			return value
		}
	}
}

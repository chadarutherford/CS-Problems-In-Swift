import Foundation

public class DoublyLinkedList<T: Comparable> {
	public var head: ListNode<T>?
	public var tail: ListNode<T>?
	public var length: Int
	
	public init(_ node: ListNode<T>? = nil) {
		self.head = node
		self.tail = node
		self.length = node != nil ? 1 : 0
	}
	
	public func count() -> Int {
		return self.length
	}
	
	public func addToHead(_ value: T) {
		let newNode = ListNode(value)
		self.length += 1
		
		if self.head == nil && self.tail == nil {
			self.head = newNode
			self.tail = newNode
		} else {
			newNode.next = self.head
			self.head?.prev = newNode
			self.head = newNode
		}
	}
	
	public func addToTail(_ value: T) {
		let newNode = ListNode(value)
		self.length += 1
		
		if self.head == nil && self.tail == nil {
			self.head = newNode
			self.tail = newNode
		} else {
			newNode.prev = self.tail
			self.tail?.next = newNode
			self.tail = newNode
		}
	}
	
	public func removeFromHead() -> T? {
		let value = self.head?.value
		self.delete(self.head)
		return value
	}
	
	public func removeFromTail() -> T? {
		let value = self.tail?.value
		self.delete(self.tail)
		return value
	}
	
	public func moveToFront(_ node: ListNode<T>) {
		let value = node.value
		self.delete(node)
		self.addToHead(value)
	}
	
	public func moveToEnd(_ node: ListNode<T>) {
		let value = node.value
		self.delete(node)
		self.addToTail(value)
	}
	
	public func delete(_ node: ListNode<T>?) {
		self.length -= 1
		
		guard let head = self.head, let tail = self.tail else { return }
		
		if head == tail {
			self.head = nil
			self.tail = nil
		} else if head == node {
			self.head = self.head?.next
			node?.delete()
		} else if tail == node {
			self.tail = self.tail?.prev
			node?.delete()
		} else {
			node?.delete()
		}
	}
	
	public func getMax() -> T? {
		if self.head == nil {
			return nil
		}
		
		var current = self.head
		var maxValue = current!.value
		
		while current != nil {
			if current!.value > maxValue {
				maxValue = current!.value
			}
			current = current?.next
		}
		
		return maxValue
	}
}

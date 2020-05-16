import Foundation

public class ListNode<T: Comparable>: Comparable {
	public var value: T
	public var prev: ListNode<T>?
	public var next: ListNode<T>?
	
	public init(_ value: T, _ prev: ListNode<T>? = nil, _ next: ListNode<T>? = nil) {
		self.value = value
		self.prev = prev
		self.next = next
	}
	
	public func insertAfter(_ value: T) {
		let currentNext = self.next
		self.next = ListNode(value, self, currentNext)
		if currentNext != nil {
			currentNext?.prev = self.next
		}
	}
	
	public func insertBefore(_ value: T) {
		let currentPrev = self.prev
		self.prev = ListNode(value, currentPrev, self)
		if currentPrev != nil {
			currentPrev?.next = self.prev
		}
	}
	
	public func delete() {
		if self.prev != nil {
			self.prev?.next = self.next
		}
		
		if self.next != nil {
			self.next?.prev = self.prev
		}
	}
	
	public static func == (lhs: ListNode<T>, rhs: ListNode<T>) -> Bool {
		return lhs.value == rhs.value
	}
	
	public static func > (lhs: ListNode<T>, rhs: ListNode<T>) -> Bool {
		return lhs.value > rhs.value
	}
	
	public static func < (lhs: ListNode<T>, rhs: ListNode<T>) -> Bool {
		return lhs.value < rhs.value
	}
}

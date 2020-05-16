import Foundation

public class BSTNode<T: Comparable> {
	public var value: T
	public var left: BSTNode<T>?
	public var right: BSTNode<T>?
	
	public init(_ value: T) {
		self.value = value
		self.left = nil
		self.right = nil
	}
	
	public func insert(_ value: T) {
		if value < self.value {
			if self.left == nil {
				self.left = BSTNode(value)
			} else {
				self.left?.insert(value)
			}
		} else {
			if self.right == nil {
				self.right = BSTNode(value)
			} else {
				self.right?.insert(value)
			}
		}
	}
	
	public func contains(_ target: T) -> Bool {
		if self.value == target {
			return true
		}
		
		if target < self.value {
			if self.left == nil {
				return false
			}
			return self.left!.contains(target)
		} else {
			if self.right == nil {
				return false
			}
			return self.right!.contains(target)
		}
	}
	
	// MARK: - Recursive Get Max
	public func getMax() -> T {
		if self.right != nil {
			return self.right!.getMax()
		} else {
			return self.value
		}
	}
	
	// MARK: - Iterative Get Max
	public func iterativeGetMax() -> T {
		var currentMax = self.value
		
		var current = self
		while current.right != nil {
			if current.value > currentMax {
				currentMax = current.value
			}
			current = current.right!
		}
		return currentMax
	}
	
	// MARK: - Recursive Depth-First Traversal
	public func forEach(_ fn: @escaping (T) -> Void) {
		fn(self.value)
		if self.left != nil {
			self.left?.forEach(fn)
		}
		if self.right != nil {
			self.right?.forEach(fn)
		}
	}
	
	// MARK: - Iterative DepthFirstTraversal
	public func iterativeForEach(_ fn: @escaping (T) -> Void) {
		var stack = [BSTNode<T>]()
		stack.append(self)
		while stack.count > 0 {
			let current = stack.removeLast()
			
			if current.right != nil {
				stack.append(current.right!)
			}
			
			if current.left != nil {
				stack.append(current.left!)
			}
			
			fn(current.value)
		}
	}
	
	// MARK: - Iterative Breadth-First Traversal
	public func breadthFirstForEach(_ fn: @escaping (T) -> Void) {
		var queue = [BSTNode<T>]()
		queue.append(self)
		while queue.count > 0 {
			let current = queue.removeFirst()
			if current.left != nil {
				queue.append(current.left!)
			}
			
			if current.right != nil {
				queue.append(current.right!)
			}
			
			fn(current.value)
		}
	}
	
	public func inOrderPrint(_ node: BSTNode<T>?) {
		if node != nil {
			self.inOrderPrint(node!.left)
			print(node!.value)
			self.inOrderPrint(node!.right)
		}
	}
	
	static public func == (lhs: BSTNode<T>, rhs: BSTNode<T>) -> Bool {
		lhs.value == rhs.value
	}
	
	static public func < (lhs: BSTNode<T>, rhs: BSTNode<T>) -> Bool {
		lhs.value < rhs.value
	}
	
	static public func > (lhs: BSTNode<T>, rhs: BSTNode<T>) -> Bool {
		lhs.value > rhs.value
	}
}

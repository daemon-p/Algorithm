//
//  List.swift
//  
//
//  Created by Dumbass Lau on 2/26/20.
//

public protocol NodeType {

    associatedtype Element

    var element: Element { get }
    var next: Self? { get }
}

class List<Element> {
    
    final class Node<Element> : NodeType {
        var next: Node<Element>?
        var element: Element
                
        init(element: Element, next: Node<Element>? = nil) {
            self.element = element
            self.next = next
        }
    }
    
    var root: Node<Element>?
    
    init(root: Node<Element>) {
        self.root = root
    }
    
    init(element: Element) {
        root = Node(element: element)
    }
    
    init(elements: [Element]) {
        
        if elements.isEmpty {
            return
        }
        
        let dummy = Node(element: elements[0])
        _ = elements.reduce(dummy) {
            $0.next = Node(element: $1)
            return $0.next!
        }
        root = dummy.next
    }
    
    var elements: [Element] {
        
        var elements: [Element] = []
        var head = root
        
        while let next = head {
            elements.append(next.element)
            head = next.next
        }
        
        return elements
    }
    
    func reverse() {
        
        var dummy = root
        var next: Node<Element>?
        var prev = next
        
        while dummy != nil {
            next = dummy?.next
            dummy?.next = prev
            prev = dummy
            dummy = next
        }
        
        root = prev
    }
}



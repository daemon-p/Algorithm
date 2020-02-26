//
//  Sorts.swift
//  
//
//  Created by Dumbass Lau on 2/26/20.
//

public protocol SortMachine {
    func sort(_ input: [Int]) -> [Int]
}

public struct MergeSort : SortMachine {
    
    public init () {
    }
    
    public func sort(_ input: [Int]) -> [Int] {
        
        var input = input
        var temp: [Int] = []
        temp.reserveCapacity(input.count)
        
        func __merge(_ l: Int, _ m: Int, _ h: Int) {
            temp.removeAll(keepingCapacity: true)
            var low = l, mid = m
            while low < m, mid < h {
                if input[low] < input[mid] {
                    temp.append(input[low])
                    low += 1
                } else {
                    temp.append(input[mid])
                    mid += 1
                }
            }
            
            temp.append(contentsOf: input[low..<m])
            temp.append(contentsOf: input[mid..<h])
            input.replaceSubrange(l..<h, with: temp)
        }
        
        var size = 1
        
        while size < input.count {
            for index in stride(from: 0, to: input.count - size, by: size * 2) {
                __merge(index, index + size, min(input.count, index + size * 2))
            }
            size *= 2
        }
        
        return input
    }
}

public struct QuickSort : SortMachine {
    
    public init() {
    }
    
    public func sort(_ input: [Int]) -> [Int] {
        
        var input = input
        
        func __partition(_ start: Int, _ end: Int) -> Int {
            var start = start, end = end
            let key = input[start]
            
            while start < end {
                while start < end, input[end] >= key {
                    end -= 1
                }
                input[start] = input[end]
                
                while start < end, input[start] <= key {
                    start += 1
                }
                input[end] = input[start]
            }
            
            input[start] = key
            return start
        }
        
        func __quickSort(_ start: Int, _ end: Int) {
            guard start < end else {
                return
            }
            
            let pivot = __partition(start, end)
            __quickSort(start, pivot - 1)
            __quickSort(pivot + 1, end)
        }
        
        __quickSort(0, input.endIndex - 1)
        return input
    }
}

public struct HeapSort : SortMachine {
    
    public init() {
    }
    
    public func sort(_ input: [Int]) -> [Int] {
        
        var input = input
        
        func __heapify(_ index: Int, endIndex: Int) {
            let left = index * 2 + 1, right = left + 1
            var __index =  index
            
            if left < endIndex, input[left] > input[__index] {
                __index = left
            }
            
            if right < endIndex, input[right] > input[__index] {
                __index = right
            }
            
            if index == __index {
                return
            }
            
            input.swapAt(index, __index)
            __heapify(__index, endIndex: endIndex)
        }
        
        for index in stride(from: input.count / 2 - 1, through: 0, by: -1) {
            __heapify(index, endIndex: input.count)
        }
        
        var index = input.endIndex - 1
        
        repeat {
            input.swapAt(0, index)
            __heapify(0, endIndex: index)
            index -= 1
        } while index > 0
        
        return input
    }
}

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

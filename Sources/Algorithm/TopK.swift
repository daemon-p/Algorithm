//
//  TopK.swift
//  
//
//  Created by Dumbass Lau on 2/26/20.
//

public struct TopK {
    
    public init() {
    }
    
    public func select(_ input: [Int], _ k: Int) -> [Int] {
        
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
        
        var start = 0, end = input.endIndex - 1
        var index = __partition(start, end)
        while index != k {
            
            if index < k {
                start += 1
            } else {
                end = index
            }
            
            if start == input.endIndex {
                index = start; break
            }
            
            index = __partition(start, end)
        }
        return .init(input.prefix(index))
    }
}

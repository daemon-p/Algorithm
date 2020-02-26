import XCTest
@testable import Algorithm

final class AlgorithmTests: XCTestCase {
    
    func testSort() {
        
        let output = Array(1...10)
        let input = output.shuffled()
        
        let sorts: [SortMachine] = [
            MergeSort(),
            QuickSort(),
            HeapSort()
        ]
        
        XCTAssertTrue(sorts.allSatisfy {
            $0.sort(input) == output
        })
    }
    
    func testTopK() {
        let topk = TopK()
        let input = Array(1...10).shuffled()
        XCTAssertEqual(topk.select(input, 3).count, 3)
        XCTAssertTrue(topk.select(input, 5).allSatisfy {
            $0 < 6
        })
        XCTAssertFalse(topk.select(input, 7).allSatisfy {
            $0 < 5
        })
    }

    static var allTests = [
        ("testSort", testSort),
        ("testTopK", testTopK)
    ]
}

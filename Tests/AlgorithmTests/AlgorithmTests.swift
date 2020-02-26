import XCTest
@testable import Algorithm

final class AlgorithmTests: XCTestCase {
    func testExample() {
        
        let output = Array(1...10)
        let input = output.shuffled()
        
        let sorts: [SortMachine] = [
            MergeSort()
        ]
        
        XCTAssertTrue(sorts.allSatisfy {
            $0.sort(input) == output
        })
        
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

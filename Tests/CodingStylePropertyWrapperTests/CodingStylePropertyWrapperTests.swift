import XCTest
import SwiftUI

@testable import CodingStylePropertyWrapper

final class CodingStylePropertyWrapperTests: XCTestCase {
    
    @CodingStylePropertyWrapper(style: .SnakeCase) var testSnake = "snake case test"
    @CodingStylePropertyWrapper(style: .CamelCase) var testCamel = "Camel test"
    @CodingStylePropertyWrapper(style: .KebabCase) var testKebab = "kebab case test"
    
    func testCodingStyle() throws {
        XCTAssertEqual(testSnake, "snake_case_test")
        XCTAssertEqual(testCamel, "CamelTest")
        XCTAssertEqual(testKebab, "kebab-case-test")
    }
}

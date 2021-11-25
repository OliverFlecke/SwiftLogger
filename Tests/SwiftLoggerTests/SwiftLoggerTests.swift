import XCTest
@testable import SwiftLogger

final class SwiftLoggerTests: XCTestCase {
    func testExample() throws {
        let logger = SimpleLogger(level: .info)
        
        XCTAssertTrue(logger.format(level: .warning, message: "Hello world").contains(" [⚠️] Hello world"))
    }
}

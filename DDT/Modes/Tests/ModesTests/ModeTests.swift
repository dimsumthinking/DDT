import XCTest
@testable import Modes

final class ModesTests: XCTestCase {
    func testCreateFromInt() throws {
      XCTAssertEqual(Mode.screen(1), Mode.production)
    }
}

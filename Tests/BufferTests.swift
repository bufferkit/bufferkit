import XCTest
@testable import BufferKit

final class BufferTests: XCTestCase {
    private var url: URL!
    private var buffer: Buffer<[Mock]>!
    
    override func setUp() {
        buffer = .init(buffered: [], file: "asd")
    }
    
    func testLoadJustOnce() async {
        var loaded = await buffer.loaded
        XCTAssertFalse(loaded)
        _ = await buffer.buffered
        loaded = await buffer.loaded
        XCTAssertTrue(loaded)
    }
}

private struct Mock: Collectable {
    static var length: any UnsignedInteger.Type = UInt8.self
    let value: UInt32
    
    var data: Data {
        .init()
        .adding(value)
    }
    
    init(data: inout Data) {
        value = data.number()
    }
}

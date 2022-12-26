import Foundation

public protocol Collectable: Bufferable {
    static var length: any UnsignedInteger.Type { get }
}

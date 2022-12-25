import Foundation

public protocol Collectable: Storable {
    static var length: any UnsignedInteger.Type { get }
}

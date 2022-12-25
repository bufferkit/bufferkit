import Foundation

public struct Composed<A, B>: Storable where A : Storable, B : Storable {
    public let a: A
    public let b: B
    
    public var data: Data {
        .init()
        .adding(a)
        .adding(b)
    }
    
    public init(data: inout Data) {
        a = .init(data: &data)
        b = .init(data: &data)
    }
}

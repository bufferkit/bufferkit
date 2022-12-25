import Foundation

public struct Wrapper<M, C>: Storable where M : Storable, C : Storable {
    public let model: M
    public let complement: C
    
    public var data: Data {
        .init()
        .adding(model)
        .adding(complement)
    }
    
    public init(data: inout Data) {
        model = .init(data: &data)
        complement = .init(data: &data)
    }
}

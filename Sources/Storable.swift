import Foundation

public protocol Storable: Sendable {
    var data: Data { get }
    
    init(data: inout Data)
}

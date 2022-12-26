import Foundation

public protocol Bufferable: Sendable {
    var data: Data { get }
    
    init(data: inout Data)
}

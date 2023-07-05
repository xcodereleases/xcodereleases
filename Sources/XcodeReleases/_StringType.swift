import Foundation

/// A protocol used to simplify implementing the ``Swift/Codable`` protocols in this package.
///
/// Do not use this protocol in your own code.
public protocol _StringType: Codable {
    
    var rawValue: String { get }
    
    init(rawValue: String)
    
}

extension _StringType {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(rawValue: try container.decode(String.self))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.rawValue)
    }
    
}

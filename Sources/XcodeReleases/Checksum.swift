import Foundation

/// The name of a checksum that may be associated with a ``Link``.
public struct Checksum: Codable, Equatable, Hashable, _StringType {
    
    /// The `sha1` checksum name.
    public static let sha1 = Checksum(rawValue: "sha1")
    
    /// The underlying raw value of the checksum's name.
    public let rawValue: String
    
    /// Create a new Checksum name.
    /// - Parameter rawValue: The raw value of the checksum name.
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
}

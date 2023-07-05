import Foundation

/// A value describing a range of supported versions
public struct VersionRange: Equatable, Hashable, Codable {
    
    /// The minimum version included in this range
    public var minimum: Version
    
    /// The maximum version included in this range
    ///
    /// A missing `maximum` value should be interpreted as either "still current" or "not known to be supported"
    public var maximum: Version?
    
    /// Create a new ``VersionRange``
    /// - Parameters:
    ///   - minimum: The minimum supported version
    ///   - maximum: The maximum supported version
    public init(minimum: Version, maximum: Version?) {
        self.minimum = minimum
        self.maximum = maximum
    }
    
}

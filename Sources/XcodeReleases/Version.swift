import Foundation

/// A version number
///
/// Version numbers are associated with ``Xcode``, ``SDK``, and ``Compiler`` values. A `Version` will always have either a `number` or a `build` or both.
public struct Version: Codable, Equatable, Hashable {
    
    /// The human-readable version number, such as "12.5.1", "5.9", or "14.0.0"
    public var number: String?
    
    /// The machine-readable version value, such as "12E507", "5.9.0.114.6", or "1400.0.29.202"
    public var build: String?
    
    /// Create a ``Version`` with a number and a build
    /// - Parameters:
    ///   - number: The human-readable version number
    ///   - build: The machine-readable version value
    public init(number: String, build: String) {
        self.number = number
        self.build = build
    }
    
    /// Create a ``Version`` with a number and optional build
    /// - Parameters:
    ///   - number: The human-readable version number
    ///   - build: The optional machine-readable version value
    public init(number: String, build: String?) {
        self.number = number
        self.build = build
    }
    
    /// Create a ``Version`` with a build and optional number
    /// - Parameters:
    ///   - number: The optional human-readable version number
    ///   - build: The machine-readable version value
    public init(number: String?, build: String) {
        self.number = number
        self.build = build
    }
}

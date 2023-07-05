import Foundation

/// The kind of an ``Xcode`` release.
public struct ReleaseKind: Equatable, Hashable, Codable {
    
    /// The name of the release
    public var name: Name
    
    /// The number of the release.
    ///
    /// This value should only be consulted on pre-release values.
    public var number: Int?
    
    /// Whether the kind represents a publicly-released version (`.release` or `.gm`)
    public var isReleased: Bool { name.isReleased }
    
    /// Whether the kind represents any kind of non-released version
    ///
    /// This is equivalent to `!isReleased`, or `isReleaseCandidate || isBeta`.
    public var isPrerelease: Bool { name.isPrerelease }
    
    /// Whether the kind represents any kind of about-to-be-released version (`.releaseCandidate` or `.gmSeed`)
    public var isReleaseCandidate: Bool { name.isReleaseCandidate }
    
    /// Whether the kind represents any kind of beta version (`.beta` or `.developerPreview`)
    public var isBeta: Bool { name.isBeta }
    
    internal init(name: Name, number: Int? = nil) {
        self.name = name
        self.number = number
    }
    
}

extension ReleaseKind {
    
    /// The name of a ``ReleaseKind``
    public struct Name: Equatable, Hashable, Codable, _StringType {
        
        /// The name of a publicly-released ``ReleaseKind``
        public static let release = Name(rawValue: "release")
        
        /// The name of a publicly-released ``ReleaseKind``
        ///
        /// Starting with version 12.1.1, Xcode switched from using "GM" and "GM Seed" to using "Release" and "Release Candidate".
        public static let gm = Name(rawValue: "gm")
        
        /// The name of an almost-final ``ReleaseKind``
        public static let releaseCandidate = Name(rawValue: "rc")
        
        /// The name of an almost-final ``ReleaseKind``
        ///
        /// Starting with version 12.1.1, Xcode switched from using "GM" and "GM Seed" to using "Release" and "Release Candidate".
        public static let gmSeed = Name(rawValue: "gmSeed")
        
        /// The name of a pre-release ``ReleaseKind``
        public static let beta = Name(rawValue: "beta")
        
        /// The name of a pre-release ``ReleaseKind``
        ///
        /// Starting with version 6.0, Xcode switched from using "Developer Preview" to using "Beta".
        public static let developerPreview = Name(rawValue: "dp")
        
        /// The underlying raw value of the release king's name.
        public let rawValue: String
        
        /// Create a new ReleaseKind name.
        /// - Parameter rawValue: The raw value of the release kind's name.
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        /// Whether the kind represents a publicly-released version (`.release` or `.gm`)
        public var isReleased: Bool {
            self == .release || self == .gm
        }
        
        /// Whether the kind represents any kind of non-released version
        ///
        /// This is equivalent to `!isReleased`, or `isReleaseCandidate || isBeta`.
        public var isPrerelease: Bool {
            self.isReleased == false
        }
        
        /// Whether the kind represents any kind of about-to-be-released version (`.releaseCandidate` or `.gmSeed`)
        public var isReleaseCandidate: Bool {
            self == .releaseCandidate || self == .gmSeed
        }
        
        /// Whether the kind represents any kind of beta version (`.beta` or `.developerPreview`)
        public var isBeta: Bool {
            self == .beta || self == .developerPreview
        }
        
        /// Whether the kind represents an unknown kind of release
        public var isUnknown: Bool {
            return self != .release && self != .gm && self != .releaseCandidate && self != .gmSeed && self != .beta && self != .developerPreview
        }
        
    }
}

extension ReleaseKind {
    
    /// A publicly-released ``ReleaseKind``.
    public static let release = ReleaseKind(name: .release)
    
    /// A publicly-released ``ReleaseKind``.
    ///
    /// Starting with version 12.1.1, Xcode switched from using "GM" and "GM Seed" to using "Release" and "Release Candidate".
    public static let gm = ReleaseKind(name: .gm)
    
    /// Create an almost-final ``ReleaseKind``
    /// - Parameter number: The number of the release
    /// - Returns: A release candidate ``ReleaseKind``
    public static func releaseCandidate(_ number: Int) -> ReleaseKind {
        return ReleaseKind(name: .releaseCandidate, number: number)
    }
    
    /// Create an almost-final ``ReleaseKind``
    /// - Parameter number: The number of the release
    /// - Returns: A GM Seed ``ReleaseKind``
    ///
    /// Starting with version 12.1.1, Xcode switched from using "GM" and "GM Seed" to using "Release" and "Release Candidate".
    public static func gmSeed(_ number: Int) -> ReleaseKind {
        return ReleaseKind(name: .gmSeed, number: number)
    }
    
    /// Create a beta ``ReleaseKind``
    /// - Parameter number: The number of the release
    /// - Returns: A beta ``ReleaseKind``
    public static func beta(_ number: Int) -> ReleaseKind {
        return ReleaseKind(name: .beta, number: number)
    }
    
    /// Create a beta ``ReleaseKind``
    /// - Parameter number: The number of the release
    /// - Returns: A Developer Preview ``ReleaseKind``
    ///
    /// Starting with version 6.0, Xcode switched from using "Developer Preview" to using "Beta".
    public static func developerPreview(_ number: Int) -> ReleaseKind {
        return ReleaseKind(name: .developerPreview, number: number)
    }
    
}

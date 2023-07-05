import Foundation

/// A released Xcode value
public struct Xcode: Equatable, Hashable {
    
    /// The name of the Xcode release
    ///
    /// For almost all releases of Xcode, this is the value `"Xcode"`. However, the 1.x versions were called "Xcode Tools"
    public var name: String
    
    /// This Xcode's ``Version``
    public var version: Version
    
    /// This Xcode's ``ReleaseKind``
    public var releaseKind: ReleaseKind
    
    /// This Xcode's ``ReleaseDate``
    public var releaseDate: ReleaseDate
    
    /// The range of macOS versions that can run this version of Xcode
    public var supportedOSRange: VersionRange
    
    /// The SDKs included in this Xcode
    public var sdks: [SDK]?
    
    /// The compilers included in this Xcode
    public var compilers: [Compiler]?
    
    /// Links associated with this Xcode
    public var links: [Link]?
    
    /// Whether this Xcode is considered "current" or not.
    ///
    /// A "current" Xcode is one that is recommended for developers to actively use. Multiple Xcodes may be considered current at the same time.
    public var isCurrent: Bool
    
    /// Create a new ``Xcode`` value
    /// - Parameters:
    ///   - name: The name of the Xcode app. This should almost always be `"Xcode"`
    ///   - version: The ``Version`` of this Xcode release
    ///   - releaseKind: The ``ReleaseKind`` of this Xcode
    ///   - releaseDate: The ``ReleaseDate`` of this Xcode
    ///   - supportedOSRange: The ``VersionRange`` of this Xcode
    ///   - sdks: The list of ``SDKs`` in this Xcode
    ///   - compilers: The list of ``Compilers`` in this Xcode
    ///   - links: Any ``Links`` associated with this Xcode
    ///   - isCurrent: Whether this Xcode is considered "current" or not
    public init(name: String, version: Version, releaseKind: ReleaseKind, releaseDate: ReleaseDate, supportedOSRange: VersionRange, sdks: [SDK]?, compilers: [Compiler]?, links: [Link]?, isCurrent: Bool) {
        self.name = name
        self.version = version
        self.releaseKind = releaseKind
        self.releaseDate = releaseDate
        self.supportedOSRange = supportedOSRange
        self.sdks = sdks
        self.compilers = compilers
        self.links = links
        self.isCurrent = isCurrent
    }
    
}

extension Xcode: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.version = try container.decode(Version.self, forKey: .version)
        self.releaseKind = try container.decode(ReleaseKind.self, forKey: .releaseKind)
        self.releaseDate = try container.decode(ReleaseDate.self, forKey: .releaseDate)
        self.supportedOSRange = try container.decode(VersionRange.self, forKey: .supportedOSRange)
        self.sdks = try container.decodeIfPresent([SDK].self, forKey: .sdks)
        self.compilers = try container.decodeIfPresent([Compiler].self, forKey: .compilers)
        self.links = try container.decodeIfPresent([Link].self, forKey: .links)
        self.isCurrent = try container.decodeIfPresent(Bool.self, forKey: .isCurrent) ?? false
    }
    
    private enum CodingKeys: CodingKey {
        case name
        case version
        case releaseKind
        case releaseDate
        case supportedOSRange
        case sdks
        case compilers
        case links
        case isCurrent
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.version, forKey: .version)
        try container.encode(self.releaseKind, forKey: .releaseKind)
        try container.encode(self.releaseDate, forKey: .releaseDate)
        try container.encode(self.supportedOSRange, forKey: .supportedOSRange)
        try container.encodeIfPresent(self.sdks, forKey: .sdks)
        try container.encodeIfPresent(self.compilers, forKey: .compilers)
        try container.encodeIfPresent(self.links, forKey: .links)
        if self.isCurrent {
            try container.encode(self.isCurrent, forKey: .isCurrent)
        }
    }
    
}

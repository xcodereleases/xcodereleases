import Foundation

/// A released Xcode value
public struct Xcode: Codable, Equatable, Hashable {
    
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
    
    public init(name: String, version: Version, releaseKind: ReleaseKind, releaseDate: ReleaseDate, supportedOSRange: VersionRange, sdks: [SDK]?, compilers: [Compiler]?, links: [Link]?) {
        self.name = name
        self.version = version
        self.releaseKind = releaseKind
        self.releaseDate = releaseDate
        self.supportedOSRange = supportedOSRange
        self.sdks = sdks
        self.compilers = compilers
        self.links = links
    }
    
}

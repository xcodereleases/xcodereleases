import Foundation

/// A link associated with an ``Xcode`` release.
///
/// Not all links represent something that is downloadable. For example, a ``Link`` can represent the location to an ``Xcode``'s release notes,
/// or to some other associated resource. More ``Link`` values may be added in the future.
public struct Link: Codable, Equatable, Hashable {
    
    /// The location of the resource associated with this link
    public var url: URL
    
    /// They size (in bytes) of the resource, if available
    public var sizeInBytes: Int?
    
    /// Checksum values for this link.
    ///
    /// For downloadable resources, the checksum helps guarantee file integrity. If a resource is downloaded and its checksum does not match,
    /// then it's possible the resource has been intercepted and replaced with a malicious payload.
    public var checksums: [Checksum: String]?
    
    /// The kind of resource this link represents
    public var kind: LinkKind
    
    /// Create a new Link
    /// - Parameters:
    ///   - url: The location of this link's resource
    ///   - sizeInBytes: The size in bytes of the resource
    ///   - checksums: Checksums for this link
    ///   - kind: The kind of resource this link represents
    public init(url: URL, sizeInBytes: Int?, checksums: [Checksum: String]?, kind: LinkKind) {
        self.url = url
        self.sizeInBytes = sizeInBytes
        self.checksums = checksums
        self.kind = kind
    }
    
    private enum CodingKeys: CodingKey {
        case url
        case sizeInBytes
        case checksums
        case kind
    }
    
    // These custom implementations can be taken out once:
    // 1. The package requires Swift 5.8 or later
    // 2. `Checksum` (or _StringType) adopts `CodingKeyRepresentable`
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(URL.self, forKey: .url)
        self.sizeInBytes = try container.decodeIfPresent(Int.self, forKey: .sizeInBytes)
        self.kind = try container.decode(LinkKind.self, forKey: .kind)
        
        if let rawChecksums = try container.decodeIfPresent([String: String].self, forKey: .checksums) {
            var checksums = [Checksum: String]()
            for (type, value) in rawChecksums {
                checksums[Checksum(rawValue: type)] = value
            }
            self.checksums = checksums
        } else {
            self.checksums = nil
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.url, forKey: .url)
        try container.encodeIfPresent(self.sizeInBytes, forKey: .sizeInBytes)
        try container.encode(self.kind, forKey: .kind)
        
        if let checksums {
            var encoded = [String: String]()
            for (type, value) in checksums {
                encoded[type.rawValue] = value
            }
            try container.encode(encoded, forKey: .checksums)
        }
    }
}

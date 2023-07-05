import Foundation

/// A set of ``Xcode`` values
public struct XcodeReleases: Codable {
    
    /// The `URL` to retrieve all known ``Xcode`` releases
    public static let allXcodesJSON: URL = URL(string: "https://xcodereleases.com/api/all.json")!
    
    /// The `URL` to retrieve all known publicly-released ``Xcode`` releases
    public static let releasedXcodesJSON: URL = URL(string: "https://xcodereleases.com/api/released.json")!
    
    /// The list of ``Xcode`` values
    public var xcodes: [Xcode]
    
    /// Create an ``XcodeReleases`` value
    /// - Parameter xcodes: The list of ``Xcode`` releases.
    public init(xcodes: [Xcode]) {
        self.xcodes = xcodes
    }
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        var xcodes: [Xcode] = []
        while container.isAtEnd == false {
            xcodes.append(try container.decode(Xcode.self))
        }
        self.xcodes = xcodes
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        for xcode in xcodes {
            try container.encode(xcode)
        }
    }
    
}

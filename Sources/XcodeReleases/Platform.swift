import Foundation

/// The name of an Apple platform.
public struct Platform: Codable, Equatable, Hashable, _StringType {
    
    /// The underlying raw value of the platform's name.
    public let rawValue: String
    
    /// Create a new Platform name
    /// - Parameter rawValue: The raw value of the platform's name
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Platform {
    
    /// Apple's macOS platform
    public static let macOS = Platform(rawValue: "macOS")
    
    /// Apple's iOS platform
    public static let iOS = Platform(rawValue: "iOS")
    
    /// Apple's watchOS platform
    public static let watchOS = Platform(rawValue: "watchOS")
    
    /// Apple's tvOS platform
    public static let tvOS = Platform(rawValue: "tvOS")
    
    /// Apple's visionOS platform
    public static let visionOS = Platform(rawValue: "visionOS")
    
}

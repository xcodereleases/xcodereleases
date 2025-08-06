import Foundation

/// A development SDK shipped as part of an ``Xcode`` release
public struct SDK: Codable, Equatable, Hashable {
    
    /// The ``Platform`` supported by this SDK
    public var platform: Platform
    
    /// The platform's OS version
    public var version: Version
    
    /// The range of OS versions to which this SDK can deploy
    public var deploymentRange: VersionRange?
    
    /// Create a new SDK value
    /// - Parameters:
    ///   - platform: The ``Platform`` supported by this SDK
    ///   - version: The platform's OS version
    public init(platform: Platform, version: Version, deploymentRange: VersionRange? = nil) {
        self.platform = platform
        self.version = version
        self.deploymentRange = deploymentRange
    }
}

extension SDK {
    
    /// Create a macOS SDK value
    /// - Parameter version: The macOS ``Version`` of the SDK
    /// - Returns: A macOS SDK value
    public static func macOS(_ version: Version, deploymentRange: VersionRange? = nil) -> SDK {
        return SDK(platform: .macOS, version: version, deploymentRange: deploymentRange)
    }
    
    /// Create an iOS SDK value
    /// - Parameter version: The iOS ``Version`` of the SDK
    /// - Returns: An iOS SDK value
    public static func iOS(_ version: Version, deploymentRange: VersionRange? = nil) -> SDK {
        return SDK(platform: .iOS, version: version, deploymentRange: deploymentRange)
    }
    
    /// Create a watchOS SDK value
    /// - Parameter version: The watchOS ``Version`` of the SDK
    /// - Returns: A watchOS SDK value
    public static func watchOS(_ version: Version, deploymentRange: VersionRange? = nil) -> SDK {
        return SDK(platform: .watchOS, version: version, deploymentRange: deploymentRange)
    }
    
    /// Create a tvOS SDK value
    /// - Parameter version: The tvOS ``Version`` of the SDK
    /// - Returns: A tvOS SDK value
    public static func tvOS(_ version: Version, deploymentRange: VersionRange? = nil) -> SDK {
        return SDK(platform: .tvOS, version: version, deploymentRange: deploymentRange)
    }
    
    /// Create a visionOS SDK value
    /// - Parameter version: The visionOS ``Version`` of the SDK
    /// - Returns: A visionOS SDK value
    public static func visionOS(_ version: Version, deploymentRange: VersionRange? = nil) -> SDK {
        return SDK(platform: .visionOS, version: version, deploymentRange: deploymentRange)
    }
    
}

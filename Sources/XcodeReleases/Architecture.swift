import Foundation

/// The name of an Architecture.
public struct Architecture: Codable, Equatable, Hashable, _StringType {
    
    /// The underlying raw value of the architecture
    public let rawValue: String
    
    /// Create a new Architecture
    /// - Parameter rawValue: The raw value of the architecture
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Architecture {
    
    /// The Arm64 architecture (Apple Silicon)
    public static let arm64 = Architecture(rawValue: "arm64")
    
    /// The X86\_64 architecture (64-bit Intel)
    public static let x86_64 = Architecture(rawValue: "x86_64")
    
    /// The i386 architecture (32-bit Intel)
    public static let i386 = Architecture(rawValue: "i386")
    
    /// The PowerPC architecture (Motorola)
    public static let powerPC = Architecture(rawValue: "ppc")
    
    
}

import Foundation

/// A description of the kind of resource pointed to by a ``Link``.
public struct LinkKind: Equatable, Hashable {
    
    /// A ``LinkKind`` to indicate that a ``Link`` represents a direct download of an Xcode installer.
    public static let xcode = LinkKind(name: .xcode)
    
    /// A ``LinkKind`` to indicate that a ``Link`` represents an Xcode version's release notes.
    public static let releaseNotes = LinkKind(name: .releaseNotes)
    
    /// Create a ``LinkKind`` representing a direct download of a simulator runtime
    /// - Parameter platform: The ``Platform`` supported by the simulator runtime
    /// - Returns: A ``LinkKind`` to indicate that a ``Link`` represents a direct download of a simulator runtime
    public static func simulatorRuntime(_ platform: Platform) -> LinkKind {
        LinkKind(name: .simulatorRuntime, simulatorRuntimePlatform: platform)
    }
    
    /// The ``Name-swift.struct`` of this ``LinkKind``.
    public var name: Name
    
    /// The ``Platform`` supported by the simulator runtime, if this ``LinkKind`` represents a direct download of a simulator runtime.
    public var simulatorRuntimePlatform: Platform?
    
    internal init(name: Name, simulatorRuntimePlatform: Platform? = nil) {
        self.name = name
        self.simulatorRuntimePlatform = simulatorRuntimePlatform
    }
    
}

extension LinkKind {
    
    /// The name of a ``LinkKind``.
    public struct Name: Equatable, Hashable, Codable, _StringType {
        
        /// A name to indicate that a ``Link`` represents a direct download of an Xcode installer.
        public static let xcode = LinkKind.Name(rawValue: "Xcode")
        
        /// A name to indicate that a ``Link`` represents an Xcode version's release notes.
        public static let releaseNotes = LinkKind.Name(rawValue: "Release Notes")
        
        /// A name to indicate that a ``Link`` represents a direct download of a simulator runtime.
        public static let simulatorRuntime = LinkKind.Name(rawValue: "Simulator Runtime")
        
        /// The underlying raw value of the ``LinkKind``'s name.
        public let rawValue: String
        
        /// Create a new LinkKind name
        /// - Parameter rawValue: The raw value of the LinkKind's name
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
    }
    
}

extension LinkKind: Codable {
    
    internal enum CodingKeys: String, CodingKey {
        case name = "name"
        case simulatorRuntimePlatform = "platform"
    }
    
}

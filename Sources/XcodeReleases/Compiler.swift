import Foundation

/// A compiler that is shipped as part of an ``Xcode`` release.
public struct Compiler: Codable, Equatable, Hashable {
    
    /// The name of a compiler
    public struct Name: Codable, Equatable, Hashable, _StringType {
        
        /// The underlying raw value of the compiler's name.
        public let rawValue: String
        
        /// Create a new Compiler name.
        /// - Parameter rawValue: The raw value of the compiler name.
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
    /// The name of the Compiler
    public var name: Name
    
    /// The ``Version`` of the Compiler.
    public var version: Version
    
    /// Create a new Compiler
    /// - Parameters:
    ///   - name: The ``Name-swift.struct`` of the Compiler
    ///   - version: The ``Version`` of the Compiler
    public init(name: Name, version: Version) {
        self.name = name
        self.version = version
    }
}

extension Compiler {
    
    /// Create a ``Compiler`` value for the `gcc` compiler
    /// - Parameter version: The ``Version`` of the `gcc` compiler
    /// - Returns: A `gcc` ``Compiler``
    public static func gcc(_ version: Version) -> Compiler {
        return Compiler(name: .gcc, version: version)
    }
    
    /// Create a ``Compiler`` value for the `llvm_gcc` compiler
    /// - Parameter version: The ``Version`` of the `gcc` compiler
    /// - Returns: A `gcc` ``Compiler``
    public static func llvm_gcc(_ version: Version) -> Compiler {
        return Compiler(name: .llvm_gcc, version: version)
    }
    
    /// Create a ``Compiler`` value for the `llvm` compiler
    /// - Parameter version: The ``Version`` of the `llvm` compiler
    /// - Returns: An `llvm` ``Compiler``
    public static func llvm(_ version: Version) -> Compiler {
        return Compiler(name: .llvm, version: version)
    }
    
    /// Create a ``Compiler`` value for the `clang` compiler
    /// - Parameter version: The ``Version`` of the `clang` compiler
    /// - Returns: A `clang` ``Compiler``
    public static func clang(_ version: Version) -> Compiler {
        return Compiler(name: .clang, version: version)
    }
    
    /// Create a ``Compiler`` value for the `swift` compiler
    /// - Parameter version: The ``Version`` of the `swift` compiler
    /// - Returns: A `swift` ``Compiler``
    public static func swift(_ version: Version) -> Compiler {
        return Compiler(name: .swift, version: version)
    }
    
}

extension Compiler.Name {
    
    /// The `gcc` compiler name
    public static let gcc = Compiler.Name(rawValue: "gcc")
    
    /// The `llvm_gcc` compiler name
    public static let llvm_gcc = Compiler.Name(rawValue: "llvm_gcc")
    
    /// The `llvm` compiler name
    public static let llvm = Compiler.Name(rawValue: "llvm")
    
    /// The `clang` compiler name
    public static let clang = Compiler.Name(rawValue: "clang")
    
    /// The `swift` compiler name
    public static let swift = Compiler.Name(rawValue: "swift")
    
}

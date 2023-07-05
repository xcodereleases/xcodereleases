import Foundation

/// A Gregorian date.
///
/// Interpreting this value should always be done using a Gregorian calendar in the `America/Los_Angeles` timezone. If your usage also requires a time of day, use 10:00 AM local time.
public struct ReleaseDate: Codable, Equatable, Hashable {
    
    /// The year value of the date
    ///
    /// - Warning: This value is not checked for calendrical correctness.
    public var year: Int
    
    /// The month value of the date (1-12)
    ///
    /// - Warning: This value is not checked for calendrical correctness.
    public var month: Int
    
    /// The day value of the date (1-31)
    ///
    /// - Warning: This value is not checked for calendrical correctness.
    public var day: Int
    
    /// Construct a new Gregorian date value.
    /// - Parameters:
    ///   - year: The numeric year value
    ///   - month: The numeric month value (1-12)
    ///   - day: The numeric day value (1-31)
    /// - Warning: The `year`, `month`, and `day` values are not checked for calendrical correctness.
    public init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
}

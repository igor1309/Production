import Foundation

/// Generic type Price.
public struct Price<U: Unit>: Hashable {
    public let amount: Roubles
    public let measurement: Measurement<U>

    public init (_ amount: Roubles, per measurement: Measurement<U>) {
        self.amount = amount
        self.measurement = measurement
    }
}

extension Price: CustomStringConvertible {
    public var description: String {
        "\(amount) per \(measurement)"
    }
}

public extension Price {
    /// Apply price to measurement
    /// Calculate the price for mass, volume or other dimension
    /// Example: flour price is ₽21 per 1 kilogram
    /// Q: What's the price of 300 grams?
    /// A: Price is ₽6.3 per 300 grams
    static func *(_ measurement: Measurement<U>,
                  _ price: Self) -> Self where U: Dimension {
        /// Convert amount of mass to unit used in price
        let converted = measurement.converted(to: price.measurement.unit)
        return Self(price.amount * converted.value, per: measurement)
    }

    static func *(_ price: Self,
                  _ measurement: Measurement<U>) -> Self where U: Dimension {
        measurement * price
    }
}

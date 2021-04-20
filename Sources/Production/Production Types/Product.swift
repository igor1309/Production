import Foundation

/// `Product` - a final good, an item produced for the direct use by end consumers. Final goods are also referred to as consumer goods.
/// Products are always measured (counted) in pieces.
/// Generic type U: Unit is defined by intermediate used (product base) and is used for intermediateQty.
public struct Product<U: Unit>: Hashable {
    public let name: String

    public let intermediate: Intermediate<U>
    public let intermediateQty: Measurement<U>

    public let package: Package

    public init(name: String,
                intermediate: Intermediate<U>,
                intermediateQty: Measurement<U>,
                package: Package) {
        self.name = name
        self.intermediate = intermediate
        self.intermediateQty = intermediateQty
        self.package = package
    }
}

extension Product: CustomStringConvertible {
    public var description: String {
        "Product(\(name) \(intermediateQty) of \(intermediate) in \(package))"
    }
}

public extension Product where U: Dimension {
    var contents: Contents {
        /// Calculate contents per 1 unit
        let normalizedContents = intermediate.contents / intermediate.measurement.value
        /// Convert qty
        let convertedQty = intermediateQty.converted(to: intermediate.measurement.unit)
        return normalizedContents * convertedQty.value
    }
}

import Foundation

/// An ingredient is the raw material or item that is combined during process manufacturing to produce the end item. Typically, raw materials are purchased.
/// Using `U: Unit` to define how to measure Ingredient: by mass or volume or pieces, etc.
public struct Ingredient<U: Unit>: Hashable {
    public let name: String

    public init(name: String) {
        self.name = name
    }
}

extension Ingredient: CustomStringConvertible {
    public var description: String { name }
}


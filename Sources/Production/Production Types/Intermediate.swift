import Foundation

/// `Intermediate` goods are referred to as those goods that are used by businesses in producing goods or services.
/// Using `U: Unit` to define how to measure (count) Product: by mass or volume or pieces, etc
public struct Intermediate<U: Unit>: Hashable {
    public let name: String

    /// Amount of intermediate (in units) produced from ingredients
    public let measurement: Measurement<U>
    /// Ingredients (formula)
    public let contents: Contents

    public init(name: String,
                measurement: Measurement<U>,
                contents: Contents) {
        self.name = name
        self.measurement = measurement
        self.contents = contents
    }
}

extension Intermediate: CustomStringConvertible {
    public var description: String {
        "\(name) \(measurement) \(contents)"
    }
}

#warning("for future use")
#warning("need the same for Product (former SKU)")
//public extension Intermediate {
//    func totalIngredientsCost(
//        pricesMass: PriceList<Ingredient<UnitMass>, UnitMass>,
//        pricesVolume: PriceList<Ingredient<UnitVolume>, UnitVolume>,
//        pricesPiece: PriceList<Ingredient<UnitPiece>, UnitPiece>
//    ) -> Roubles {
//        let byMass = ingredientsByMass * pricesMass
//        let byVolume = ingredientsByVolume * pricesVolume
//        let byPiece = ingredientsByPiece * pricesPiece
//
//        return byMass.total() + byVolume.total() + byPiece.total()
//    }
//}

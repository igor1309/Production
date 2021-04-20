import Foundation
import Production

public extension Ingredient where U == UnitMass {
    static let flour = Self(name: "Flour")
    static let rennet = Self(name: "Rennet")
    static var mincedMeat = Self(name: "Minced Meat")
    static let cheese = Self(name: "Сыр")
    static let spices = Self(name: "Специи")

}

public extension Ingredient where U == UnitVolume {
    static let milk = Self(name: "Milk")
}

public extension Ingredient where U == UnitPiece {
    static let apple = Self(name: "Apple")
}

public extension Intermediate where U == UnitVolume {
    static let milk = Self(
        name: "Milk",
        measurement: .oneLiter,
        contents: Contents(
            byVolume: [.milk: .init(1, .liters)]
        )
    )
}

public extension Product where U == UnitVolume {
    static let milk = Self(
        name: "Milk pack",
        intermediate: Intermediate<UnitVolume>.milk,
        intermediateQty: .init(0.7, .liters),
        package: .pack
    )
}

public extension Package {
    static let vacuum = Package(name: "vacuum")
    static let pack = Package(name: "pack")
}

extension Price where U == UnitMass {
    public static let sample = Self(99, per: .oneKilogram)
}

// MARK: - Хмели-сунели

public extension Intermediate where U == UnitMass {
    static let khmeliSuneli = Self(
        name: "Хмели-сунели",
        measurement: .oneKilogram,
        contents: Contents(
            byMass: [.spices: .oneKilogram]
        )
    )
}

public extension Product where U == UnitMass {
    static let khmeliSuneli250 = Self(
        name: "Хмели-сунели",
        intermediate: .khmeliSuneli,
        intermediateQty: .init(250, .grams),
        package: .pack
    )
}

// MARK: - Хинкали

public extension Intermediate where U == UnitPiece {
    static let khinkali = Self(
        name: "Хинкали",
        measurement: .onePiece,
        contents: Contents(
            byMass: [
                .flour: .init(120, .grams),
                .mincedMeat: . init(30, .grams)
            ]
        )
    )
}

public extension Product where U == UnitPiece {
    static let khinkali10 = Self(
        name: "Хинкали",
        intermediate: .khinkali,
        intermediateQty: .init(10, .pieces),
        package: .vacuum
    )
}

public extension Product where U == UnitPiece {
    static let khinkali12 = Self(
        name: "Хинкали",
        intermediate: .khinkali,
        intermediateQty: .dozen,
        package: .vacuum
    )
}

// MARK: - Хачапури

public extension Intermediate where U == UnitPiece {
    static let khachapuri = Self(
        name: "Хачапури",
        measurement: .onePiece,
        contents: Contents(
            byMass: [.flour: .init(120, .grams)]
        )
    )
}

public extension Product where U == UnitPiece {
    static let khachapuri2 = Self(
        name: "Хачапури 2 шт",
        intermediate: .khachapuri,
        intermediateQty: .init(2, .pieces),
        package: .vacuum
    )
}

// MARK: - Simple Cheese

public extension Intermediate where U == UnitMass {
    static let simpleCheese = Self(
        name: "Сыр",
        measurement: .init(0.9, .kilograms),
        contents: Contents(
            byMass: [.rennet: .init(4, .grams)],
            byVolume: [.milk: .init(9, .liters)]
        )
    )
}

public extension Product where U == UnitMass {
    static let simpleCheese250grams = Self(
        name: "Сыр 250г",
        intermediate: .simpleCheese,
        intermediateQty: .init(250, .grams),
        package: .pack
    )
}

// MARK: - Price List

public extension Ingredient where U == UnitMass {
    static let priceList: PriceList<Ingredient> = [
        .flour: Price(21, per: .oneKilogram),
        .mincedMeat: Price(450, per: .oneKilogram),
        .cheese: Price(220, per: .oneKilogram)
    ]

}


import Foundation

extension Measurement {
    public init(_ value: Double, _ unit: UnitType) {
        self.init(value: value, unit: unit)
    }
}

extension Measurement where UnitType == UnitPiece {
    public static let onePiece = Self(1, .pieces)
    public static let dozen = Self(12, .pieces)
}

extension Measurement where UnitType == UnitMass {
    public static let oneKilogram = Self(1, .kilograms)
}

extension Measurement where UnitType == UnitVolume {
    public static let oneLiter = Self(1, .liters)
}

import Foundation

public struct Contents: Hashable {
    public let byMass: Recipe<UnitMass>
    public let byVolume: Recipe<UnitVolume>
    public let byPiece: Recipe<UnitPiece>

    public init(byMass: Recipe<UnitMass>,
                byVolume: Recipe<UnitVolume> = [:],
                byPiece: Recipe<UnitPiece> = [:]) {
        self.byMass = byMass
        self.byVolume = byVolume
        self.byPiece = byPiece
    }

    public init(byVolume: Recipe<UnitVolume>,
                byPiece: Recipe<UnitPiece> = [:]) {
        self.byMass = [:]
        self.byVolume = byVolume
        self.byPiece = byPiece
    }
}

extension Contents: CustomStringConvertible {
    public var description: String {
        let byMassStr = byMass.isEmpty ? "" : " \(byMass)"
        let byVolumeStr = byVolume.isEmpty ? "" : " \(byVolume)"
        let byPieceStr = byPiece.isEmpty ? "" : " \(byPiece)"

        return "Contents\(byMassStr)\(byVolumeStr)\(byPieceStr)"
    }
}

public extension Contents {
    static func *(lhs: Self, rhs: Double) -> Self {
        Self(byMass: lhs.byMass * rhs,
             byVolume: lhs.byVolume * rhs,
             byPiece: lhs.byPiece * rhs
        )
    }
    static func /(lhs: Self, rhs: Double) -> Self {
        lhs * (1 / rhs)
    }
}

public extension Recipe {
    static func *(lhs: Self,
                  rhs: Double) -> Self where Key: Unitable,
                                             Value == Measurement<Key.UnitType> {
        lhs.mapValues { $0 * rhs }
    }
}

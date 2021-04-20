import Foundation

public class UnitPiece: Dimension {
    public static let pieces = UnitPiece(
        symbol: "pc",
        converter: UnitConverterLinear(coefficient: 1.0)
    )

    public static let baseUnit = UnitPiece.pieces
}

import Foundation

/// NSUnit is intended for subclassing. For dimensional units, you should use one of the Apple provided Dimension subclasses listed in Table 1, or create a custom subclass of Dimension. You can create a direct subclass of NSUnit to represent a custom dimensionless unit, such as a count, score, or ratio.
/// https://developer.apple.com/documentation/foundation/unit
/// Piece looks like a dimensionless unit. But functions overload for Unit and Dimention if difficult, if even possible, to create (at least I haven't found the solution) so I've decided to work with Dimention
/// create custom unit
/// https://developer.apple.com/documentation/foundation/dimension
///
public class UnitPiece: Dimension {
    public static let pieces = UnitPiece(
        symbol: "pc",
        converter: UnitConverterLinear(coefficient: 1.0)
    )

    public static let baseUnit = UnitPiece.pieces
}

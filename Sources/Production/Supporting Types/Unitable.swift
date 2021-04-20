import Foundation

// MARK: - Unitable

public protocol Unitable: Hashable {
    associatedtype UnitType: Unit
}
extension Ingredient: Unitable {
    public typealias UnitType = U
}
extension Intermediate: Unitable {
    public typealias UnitType = U
}
extension Product: Unitable {
    public typealias UnitType = U
}
extension Price: Unitable {
    public typealias UnitType = U
}
extension Measurement: Unitable {}

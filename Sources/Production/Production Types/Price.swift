import Foundation

public struct Price<U: Unit>: Hashable {
    public let value: Roubles
    public let measurement: Measurement<U>

    public init (_ value: Roubles, per measurement: Measurement<U>) {
        self.value = value
        self.measurement = measurement
    }
}

extension Price: CustomStringConvertible {
    public var description: String {
        "\(value) per \(measurement)"
    }
}

import Foundation

public struct Package: Hashable {
    public let name: String

    public init(name: String) {
        self.name = name
    }
}

extension Package: CustomStringConvertible {
    public var description: String { name }
}

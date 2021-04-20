import Foundation

public typealias Catalog<T, V> = Dictionary<T, V> where T: Unitable,
                                                 V: Unitable,
                                                 T.UnitType == V.UnitType

public typealias Recipe<U> = Dictionary<Ingredient<U>, Measurement<U>> where U: Unit
public typealias Measurements<T: Unitable> = Dictionary<T, Measurement<T.UnitType>>
public typealias PriceList<T: Unitable> = Dictionary<T, Price<T.UnitType>>

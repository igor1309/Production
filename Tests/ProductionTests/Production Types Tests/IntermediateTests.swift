//
//  IntermediateTests.swift
//  
//
//  Created by Igor Malyarov on 20.04.2021.
//

import XCTest
import Production

final class IntermediateTests: XCTestCase {
    func testIntermediateInit() {
        let byMass: Recipe<UnitMass> = [.flour: .init(120, .grams)]
        let intermediate = Intermediate<UnitMass>(
            name: "sample",
            measurement: .oneKilogram,
            contents: Contents(byMass: byMass)
        )
        XCTAssertEqual(intermediate.name, "sample")
        XCTAssertEqual(intermediate.measurement.value, 1)
        XCTAssertEqual(intermediate.measurement.unit, .kilograms)
        XCTAssertEqual(intermediate.contents.byMass[.flour]?.value, 120)

        let intermediate2 = Intermediate<UnitPiece>.khachapuri
        XCTAssertEqual(intermediate2.name, "Хачапури")
        XCTAssertEqual(intermediate2.measurement.value, 1)
        XCTAssertEqual(intermediate2.measurement.unit, .pieces)
        XCTAssertEqual(intermediate2.contents.byMass[.flour]?.value, 120)
    }

    func testIntermediateDescription() {
        let intermediate = Intermediate<UnitMass>.simpleCheese
        XCTAssertEqual(intermediate.description,
                       "Сыр 0.9 kg Contents [Rennet: 4.0 g] [Milk: 9.0 L]")

        let byMass: Recipe<UnitMass> = [.flour: .init(120, .grams)]
        let byVolume: Recipe<UnitVolume> = [.milk: .init(5, .cups)]
        let byPiece: Recipe<UnitPiece> = [.apple: .dozen]

        let contents = Contents(byMass: byMass,
                                byVolume: byVolume,
                                byPiece: byPiece)

        let intermediate2 = Intermediate<UnitPiece>(
            name: "sample",
            measurement: .dozen,
            contents: contents
        )
        XCTAssertEqual(intermediate2.description,
                       "sample 12.0 pc Contents [Flour: 120.0 g] [Milk: 5.0 cup] [Apple: 12.0 pc]")

    }

}

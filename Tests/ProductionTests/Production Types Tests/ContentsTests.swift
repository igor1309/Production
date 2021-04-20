//
//  ContentsTests.swift
//
//
//  Created by Igor Malyarov on 20.04.2021.
//

import XCTest
import Production

final class ContentsTests: XCTestCase {
    func testContentsInit() {
        let byMass: Recipe<UnitMass> = [.flour: .init(120, .grams)]
        let byVolume: Recipe<UnitVolume> = [.milk: .init(5, .cups)]
        let byPiece: Recipe<UnitPiece> = [.apple: .dozen]

        let contents1 = Contents(byMass: byMass)
        XCTAssertEqual(contents1,
                       Contents(byMass: byMass,
                                byVolume: [:],
                                byPiece: [:])
        )

        let contents2 = Contents(byMass: byMass,
                                 byVolume: byVolume,
                                 byPiece: byPiece
        )
        XCTAssertEqual(contents2,
                       Contents(byMass: byMass,
                                byVolume: byVolume,
                                byPiece: byPiece)
        )

        let contents3 = Contents(byVolume: byVolume)
        XCTAssertEqual(contents3,
                       Contents(byMass: [:],
                                byVolume: byVolume,
                                byPiece: [:])
        )

        let contents4 = Contents(byVolume: byVolume,
                                 byPiece: byPiece
        )
        XCTAssertEqual(contents4,
                       Contents(byMass: [:],
                                byVolume: byVolume,
                                byPiece: byPiece)
        )
    }

    func testContentsDescription() {
        let byMass: Recipe<UnitMass> = [.flour: .init(120, .grams)]
        let byVolume: Recipe<UnitVolume> = [.milk: .init(5, .cups)]
        let byPiece: Recipe<UnitPiece> = [.apple: .dozen]

        let contents = Contents(byMass: byMass,
                                byVolume: byVolume,
                                byPiece: byPiece)
        XCTAssertEqual(
            contents.description,
            "Contents [Flour: 120.0 g] [Milk: 5.0 cup] [Apple: 12.0 pc]"
        )

        XCTAssertEqual(
            Intermediate.milk.contents.description,
            "Contents [Milk: 1.0 L]"
        )
        XCTAssertEqual(
            Intermediate.khachapuri.contents.description,
            "Contents [Flour: 120.0 g]"
        )
        XCTAssertEqual(
            Intermediate.simpleCheese.contents.description,
            "Contents [Rennet: 4.0 g] [Milk: 9.0 L]"
        )
    }

    func testMultiplyContentsByDouble() {
        let contents = Intermediate.simpleCheese.contents
        let multiplied = contents * 5.5
        XCTAssertEqual(
            multiplied,
            Contents(
                byMass: [.rennet: .init(4 * 5.5, .grams)],
                byVolume: [.milk: .init(9 * 5.5, .liters)]
            )
        )
    }

    func testDivideContentsByDouble() {
        let contents = Intermediate.simpleCheese.contents
        let divided = contents / 5.5
        XCTAssertEqual(
            divided,
            Contents(
                byMass: [.rennet: .init(4 / 5.5, .grams)],
                byVolume: [.milk: .init(9 / 5.5, .liters)]
            )
        )
    }
}

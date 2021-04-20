//
//  ProductTests.swift
//  
//
//  Created by Igor Malyarov on 20.04.2021.
//

import XCTest
import Production

final class ProductTests: XCTestCase {
    func testProductInit() {
        let product1 = Product<UnitMass>(
            name: "sample1",
            intermediate: Intermediate<UnitMass>.simpleCheese,
            intermediateQty: Measurement<UnitMass>(0.5, .kilograms),
            package: Package.pack
        )
        XCTAssertEqual(product1.name, "sample1")
        XCTAssertEqual(product1.intermediate, .simpleCheese)
        XCTAssertEqual(product1.intermediateQty.value, 0.5)
        XCTAssertEqual(product1.intermediateQty.unit, .kilograms)
        XCTAssertEqual(product1.package, .pack)

        let product2 = Product<UnitVolume>(
            name: "sample2",
            intermediate: Intermediate<UnitVolume>.milk,
            intermediateQty: Measurement<UnitVolume>(15, .cubicInches),
            package: .vacuum
        )
        XCTAssertEqual(product2.name, "sample2")
        XCTAssertEqual(product2.intermediate, .milk)
        XCTAssertEqual(product2.intermediateQty.value, 15)
        XCTAssertEqual(product2.intermediateQty.unit, .cubicInches)
        XCTAssertEqual(product2.package, .vacuum)

        let product3 = Product<UnitPiece>(
            name: "sample3",
            intermediate: Intermediate<UnitPiece>.khachapuri,
            intermediateQty: .dozen,
            package: .vacuum
        )
        XCTAssertEqual(product3.name, "sample3")
        XCTAssertEqual(product3.intermediate, .khachapuri)
        XCTAssertEqual(product3.intermediateQty.value, 12)
        XCTAssertEqual(product3.intermediateQty.unit, .pieces)
        XCTAssertEqual(product3.package, .vacuum)
    }

    func testProductDescription() {
        XCTAssertEqual(Product<UnitMass>.simpleCheese250grams.description,
                       "Product(Сыр 250г 250.0 g of Сыр 0.9 kg Contents [Rennet: 4.0 g] [Milk: 9.0 L] in pack)")

        XCTAssertEqual(Product<UnitVolume>.milk.description,
                       "Product(Milk pack 0.7 L of Milk 1.0 L Contents [Milk: 1.0 L] in pack)")

        XCTAssertEqual(Product<UnitPiece>.khachapuri2.description,
                       "Product(Хачапури 2 шт 2.0 pc of Хачапури 1.0 pc Contents [Flour: 120.0 g] in vacuum)")
    }

    func testProductContents() {
        let contents1 = Product<UnitMass>.simpleCheese250grams.contents
        XCTAssertEqual(
            contents1,
            Contents(
                byMass: [.rennet: .init(4 / 0.9 * 0.25, .grams)],
                byVolume: [.milk: .init(2.5, .liters)])
        )

        let contents2 = Product<UnitVolume>.milk.contents
        XCTAssertEqual(
            contents2,
            Contents(byVolume: [.milk: .init(0.7, .liters)])
        )

        let contents3 = Product<UnitPiece>.khachapuri2.contents
        XCTAssertEqual(
            contents3,
            Contents(byMass: [.flour: .init(2 * 120.0, .grams)])
        )
    }

}

//
//  PriceTests.swift
//  
//
//  Created by Igor Malyarov on 20.04.2021.
//

import XCTest
import Production

final class PriceTests: XCTestCase {
    func testPriceInit() {
        let price1 = Price<UnitMass>(99, per: .oneKilogram)
        XCTAssertEqual(price1.amount, 99)
        XCTAssertEqual(price1.measurement.value, 1)
        XCTAssertEqual(price1.measurement.unit, .kilograms)

        let price2 = Price<UnitVolume>(199, per: .oneLiter)
        XCTAssertEqual(price2.amount, 199)
        XCTAssertEqual(price2.measurement.value, 1)
        XCTAssertEqual(price2.measurement.unit, .liters)

        let price3 = Price<UnitPiece>(999, per: .dozen)
        XCTAssertEqual(price3.amount, 999)
        XCTAssertEqual(price3.measurement.value, 12)
        XCTAssertEqual(price3.measurement.unit, .pieces)
    }

    func testPriceDescription() {
        let price1 = Price<UnitMass>(99, per: .oneKilogram)
        XCTAssertEqual(price1.description, "99.0 per 1.0 kg")

        let price2 = Price<UnitVolume>(199, per: .oneLiter)
        XCTAssertEqual(price2.description, "199.0 per 1.0 L")

        let price3 = Price<UnitPiece>(999, per: .dozen)
        XCTAssertEqual(price3.description, "999.0 per 12.0 pc")
    }

    func testPriceMultiplicationByMeasurement() {
        let price1 = Price<UnitMass>(99, per: .oneKilogram)
        let measurement1 = Measurement<UnitMass>(550, .grams)
        let cost1 = measurement1 * price1

        XCTAssertEqual(cost1.amount, 99 * 0.550)
        XCTAssertEqual(cost1.measurement.value, 550)
        XCTAssertEqual(cost1.measurement.unit, .grams)

        let cost1b = price1 * measurement1
        XCTAssertEqual(cost1, cost1b)
    }

}

//
//  Measurement+Ext Tests.swift
//  
//
//  Created by Igor Malyarov on 20.04.2021.
//

import XCTest
import Production

final class MeasurementExtTests: XCTestCase {
    func testMeasurementInit() {
        let measurement1 = Measurement<UnitMass>(111, .carats)
        let measurement2 = Measurement<UnitMass>(value: 111, unit: .carats)

        XCTAssertEqual(measurement1, measurement2)
    }

    func testMeasurementUnitPieceStatic() {
        XCTAssertEqual(Measurement<UnitPiece>.onePiece,
                       Measurement<UnitPiece>(value: 1, unit: .pieces))
        XCTAssertEqual(Measurement<UnitPiece>.dozen,
                       Measurement<UnitPiece>(value: 12, unit: .pieces))
    }

    func testMeasurementUnitMassStatic() {
        XCTAssertEqual(Measurement<UnitMass>.oneKilogram,
                       Measurement<UnitMass>(value: 1, unit: .kilograms))
    }

    func testMeasurementUnitVolumeStatic() {
        XCTAssertEqual(Measurement<UnitVolume>.oneLiter,
                       Measurement<UnitVolume>(value: 1, unit: .liters))
    }

}

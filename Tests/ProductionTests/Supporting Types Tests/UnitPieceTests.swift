//
//  UnitPieceTests.swift
//  
//
//  Created by Igor Malyarov on 20.04.2021.
//

import XCTest
import Production

final class UnitPieceTests: XCTestCase {
    func testBaseUnit() {
        let piece = UnitPiece.pieces
        let base = UnitPiece.baseUnit

        XCTAssertEqual(piece, base)
    }
}

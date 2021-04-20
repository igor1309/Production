//
//  IngredientTests.swift
//  
//
//  Created by Igor Malyarov on 20.04.2021.
//

import XCTest
import Production

final class IngredientTests: XCTestCase {
    func testIngredientInit() {
        let ingredient = Ingredient(name: "apple")
        XCTAssertEqual(ingredient.name, "apple")
    }

    func testIngredientDescription() {
        let ingredient = Ingredient(name: "apple")
        XCTAssertEqual(ingredient.description, "apple")
    }

}

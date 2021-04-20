//
//  PackageTests.swift
//  
//
//  Created by Igor Malyarov on 20.04.2021.
//

import XCTest
import Production

final class PackageTests: XCTestCase {
    func testPackageInit() {
        let package = Package(name: "vacuum")
        XCTAssertEqual(package.name, "vacuum")
    }

    func testPackageDescription() {
        let package = Package(name: "vacuum")
        XCTAssertEqual(package.description, "vacuum")
    }

}

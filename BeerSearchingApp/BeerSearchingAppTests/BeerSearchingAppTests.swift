//
//  BeerSearchingAppTests.swift
//  BeerSearchingAppTests
//
//  Created by Juan Fernández Otero on 29/5/21.
//

import XCTest
@testable import BeerSearchingApp

class BeerSearchingAppTests: XCTestCase {


    func testExample() throws {
        var beer: Beer
        NetworkingProvider.shared.getBeerByName(name: "") { value in
            XCTAssertNil(value)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

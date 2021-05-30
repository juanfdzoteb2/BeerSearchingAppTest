//
//  BeerSearchingAppTests.swift
//  BeerSearchingAppTests
//
//  Created by Juan Fernández Otero on 29/5/21.
//

import XCTest
@testable import BeerSearchingApp

class BeerSearchingAppTests: XCTestCase {



    func testNetworkProviderResturnNilOnEmptyString() throws {
        

        NetworkingProvider.shared.getBeerByName(name: "") { value in
            XCTAssertNil(value)
        }
        
    }
    func testNetworkProviderReturnValidList() throws {
        
        let expectationFoodChicken = expectation(description: "wait_for_beer_chicken")
        NetworkingProvider.shared.getBeerByName(name: "chicken") { value in
            XCTAssertNotNil(value)
            expectationFoodChicken.fulfill()

        }
        waitForExpectations(timeout: 2, handler: nil)

    }
    
    func testNetworkProviderReturnSameOutput() throws {
        
        let expectationFoodChicken = expectation(description: "wait_for_beer_chicken")
        NetworkingProvider.shared.getBeerByName(name: "chicken") { value1 in
            NetworkingProvider.shared.getBeerByName(name: "chicken") { value2 in
                XCTAssertEqual(value1,value2)
                expectationFoodChicken.fulfill()

            }

        }
        waitForExpectations(timeout: 2, handler: nil)

    }



}

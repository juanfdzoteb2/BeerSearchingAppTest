//
//  BeerSearchingAppUITests.swift
//  BeerSearchingAppUITests
//
//  Created by Juan Fernández Otero on 29/5/21.
//

import XCTest

class BeerSearchingAppUITests: XCTestCase {

    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
   
        let searchField = app.otherElements["searchBar"].searchFields.firstMatch
        
        searchField.tap()
        searchField.typeText("chicken")
        
        //Change these sleeps for an expectation
        sleep(4)
        let cellQuery = app.tables.cells.element(boundBy: 1)
        
        cellQuery.tap()
        sleep(1)



        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

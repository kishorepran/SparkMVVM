//
//  SparkMVVMUITests.swift
//  SparkMVVMUITests
//
//  Created by Pran Kishore on 06/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import XCTest

class SparkMVVMUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    var tableView: XCUIElement {
        return app.tables.element(boundBy: 0)
    }
    
    var slider: XCUIElement {
        return app.sliders.element(boundBy: 0)
    }
    
    var tableViewCells: XCUIElementQuery {
        return tableView.cells
    }
    
    var navigationBar: XCUIElement {
        return app.navigationBars.element(boundBy: 0)
    }

    func cell(atRow rowNo: Int) -> XCUIElement {
        return tableView.cells.element(boundBy: rowNo)
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.

        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSingleChoiceConditional() {
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //Questions secreen is visible.
        XCTAssert(app.navigationBars["Questions"].exists)
        //Tap on the first row of the table view cell.
        cell(atRow: 2).tap()
        
        //Questions secreen is visible.
        XCTAssert(app.navigationBars["Options"].exists)

        //Tap on the first row of the table view cell.
        cell(atRow: 0).tap()
        XCTAssertFalse(slider.exists, "No slider should be visible now")
        //Tap on the Second row of the table view cell.
        cell(atRow: 1).tap()
        XCTAssertFalse(slider.exists, "No slider should be visible now")
        //Tap on the third row of the table view cell.
        cell(atRow: 2).tap()
        XCTAssertTrue(slider.exists, "Slider should be visible now")
        
        //Check if back button exixts.
        XCTAssert(navigationBar.buttons["Questions"].exists)
        navigationBar.buttons["Questions"].tap()
        
        //Questions secreen is visible again.
        XCTAssert(app.navigationBars["Questions"].exists)
        //Tap on the first row of the table view cell.
        XCTAssertFalse(cell(atRow: 0).staticTexts["N/A"].exists, "Since we have selected an option the answer should be recorded.")
    }
    
    
    
    func testSingleChoice() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //Questions secreen is visible.
        XCTAssert(app.navigationBars["Questions"].exists)
        //Tap on the first row of the table view cell.
        cell(atRow: 0).tap()
        
        //Options secreen is visible.
        XCTAssert(app.navigationBars["Options"].exists)
        //Tap on the first row of the table view cell.
        cell(atRow: 0).tap()
        //Tap on the first row of the table view cell.
        cell(atRow: 1).tap()
        //Check if back button exixts.
        XCTAssert(navigationBar.buttons["Questions"].exists)
        navigationBar.buttons["Questions"].tap()
        
        //Questions secreen is visible again.
        XCTAssert(app.navigationBars["Questions"].exists)
        //Tap on the first row of the table view cell.
        XCTAssertFalse(cell(atRow: 0).staticTexts["N/A"].exists, "Since we have selected an option the answer should be recorded.")
    }
    
}

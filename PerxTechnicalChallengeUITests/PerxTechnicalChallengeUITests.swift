//
//  PerxTechnicalChallengeUITests.swift
//  PerxTechnicalChallengeUITests
//
//  Created by Tyson Langton-Weatherley on 25/1/2023.
//

import XCTest

final class PerxTechnicalChallengeUITests: XCTestCase {
    
    let app = XCUIApplication()
    let appObjs = AppObjs()
    let waitTimerDefault: TimeInterval = 5
    
    override func setUp() {
        app.launch()
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testValidFDASearchWithResult() throws {
        
        let searchField = appObjs.searchDrugsTextField
        let detailPageView = appObjs.detailPageView
        let result = appObjs.abstractedViewChevronImage
        
        XCTAssertTrue(searchField.waitForExistence(timeout: waitTimerDefault))
        
        searchField.tap()
        searchField.typeText("pramoxine")
        
        
        XCTAssertTrue(result.firstMatch.waitForExistence(timeout: waitTimerDefault))
        result.tap()
        
        
        XCTAssertTrue(detailPageView.waitForExistence(timeout: waitTimerDefault))
    }
    
    func testInvalidFDASearchWithoutResult() throws {
        
        let searchField = appObjs.searchDrugsTextField
        
        let result = appObjs.abstractedViewChevronImage
        
        XCTAssertTrue(searchField.waitForExistence(timeout: waitTimerDefault))
        
        searchField.tap()
        searchField.typeText("This isnt a valid search query")
        
        
        XCTAssertFalse(result.firstMatch.waitForExistence(timeout: waitTimerDefault))
        
        
        
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
struct AppObjs {
    
    let app = XCUIApplication()
    
    public var searchDrugsTextField: XCUIElement {
        app.textFields["Search Drugs Text Field"]
    }
    
    public var detailPageView: XCUIElement {
        app.collectionViews["Detail Page View"]
    }
    
    public var abstractedViewChevronImage: XCUIElement {
        app.images["Abstracted View Chevron Nav"]
    }
    
}

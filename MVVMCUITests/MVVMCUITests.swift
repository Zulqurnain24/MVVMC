//
//  MVVMCUITests.swift
//  MVVMCUITests
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import XCTest

import XCTest

class MVVMCUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        print("debugDescription: \(app.debugDescription)")
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }
    
    func testRouteToDetailView() throws {
        let app = XCUIApplication()

        let collectionView = app.collectionViews.firstMatch

        // ensure the search field exists
        XCTAssertTrue(collectionView.exists && collectionView.isHittable && collectionView.isEnabled, "CollectionView should be visible and enabled")
        let predicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: collectionView)
        XCTWaiter().wait(for: [expectation], timeout: 5.0)

        // Tap the first cell in the collection view
        if collectionView.cells.count > 0 {
            let firstCell = collectionView.cells.element(boundBy: 0)
            firstCell.tap()
        } else {
            XCTFail("No cells found in collection view")
        }
        
    }
    
}

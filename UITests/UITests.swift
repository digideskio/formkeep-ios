//
//  UITests.swift
//  UITests
//
//  Created by Goose Mongeau on 11/13/15.
//  Copyright © 2015 thoughtbot. All rights reserved.
//

import Nocilla
import XCTest

class UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        stubRequest("POST", "https://formkeep.com/api/auth")
            .withHeaders([ "Accept": "application/json" ])
            .withBody("{\"email\": \"test@example.com\", \"password\": \"password\"}")
            .andReturn(200)
            .withBody("{\"user\": {\"email\": \"test@example.com\", \"auth_token\": \"abc123\"} }")
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@example.com")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        app.buttons["Login"].tap()
        
        XCTAssert(false);
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}

//
//  MarsRoverTDDUITests.swift
//  MarsRoverTDDUITests
//
//  Created by Angel on 22/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import XCTest

class MarsRoverTDDUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        continueAfterFailure = false
    }

    override func tearDown() {

        super.tearDown()
    }

    func testExecuteCommandsShowPosition() {

        app.launch()
        let textField = app.textFields.matching(identifier: "commandTextField").element
        let label = app.staticTexts["displayLabel"]
        textField.tap()
        textField.typeText("FFR")
        app.buttons["Done"].tap()
        app.buttons.matching(identifier: "mainButton").element.tap()
        XCTAssertEqual("5,7,east", label.label)
    }

}

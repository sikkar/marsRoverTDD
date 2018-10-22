//
//  MarsRoverPresenterTests.swift
//  MarsRoverTDDTests
//
//  Created by Angel on 19/10/2018.
//  Copyright © 2018 Angel. All rights reserved.
//

import XCTest
@testable import MarsRoverTDD

class MarsRoverPresenterTests: XCTestCase {

    var sut: MarsRoverPresenter!
    var marsRoverView: MarsRoverViewMock!

    override func setUp() {
        super.setUp()
        sut = MarsRoverPresenter()
        marsRoverView = MarsRoverViewMock()
        sut.view = marsRoverView
    }

    override func tearDown() {
        sut = nil
        marsRoverView = nil
        super.tearDown()
    }

    func testCommandIsEmptyButtonIsDisabled() {
        //Arrange

        //Act
        sut.commandHasChanged(command: "")
        //Assert
        XCTAssertFalse(marsRoverView.buttonStatus ?? true)
    }

    func testCommandIsNotEmptyButtonIsEnabled() {
        //Arrange

        //Act
        sut.commandHasChanged(command: "texto")
        //Assert
        XCTAssertTrue(marsRoverView.buttonStatus ?? false)
    }

    func testExecuteCommandShowStatus() {
        //Arrange
        let text = "hola"
        let rover = RoverMock()
        rover.expectedDescription = text
        sut.rover = rover
        //Act
        sut.mainButtonPressed()
        //Assert
        XCTAssertEqual(text, marsRoverView.currentStatus)
    }

    class MarsRoverViewMock: MarsRoverView {

        var buttonStatus: Bool?
        var currentStatus: String?

        func showStatus(status: String) {
            currentStatus = status
        }

        func clearCommands() {
            // Commit
        }

        func enableExecuteButton(_ enable: Bool) {
            buttonStatus = enable
        }

    }

    class RoverMock: Rover {

        var expectedDescription: String?
        var recievedCommand: String?

        override func receiveCommands(_ commands: String) {
            recievedCommand = commands
        }

        override var description: String {
            return expectedDescription ?? ""
        }
    }
}

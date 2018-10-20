//
//  RoverTests.swift
//  MarsRoverTDDTests
//
//  Created by Angel on 22/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import XCTest
@testable import MarsRoverTDD

class RoverTests: XCTestCase {

    var sut: Rover!

    override func setUp() {
        super.setUp()
        sut = Rover()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }

    func testInitialOrientationIsNorth() {
        XCTAssertEqual(.north, sut.orientation)
    }

    func testInitalPositionIsFiveFive() {
        XCTAssertEqual(5, sut.x)
        XCTAssertEqual(5, sut.y)
    }

    func testTurnRightLooksEast() {
        sut.receiveCommands(generateCommands(.right))
        //Assert
        XCTAssertEqual(.east, sut.orientation)
    }

    func testTwoTurnsRightLooksSouth() {
        //Act
        sut.receiveCommands(generateCommands(.right, .right))
        //Assert
        XCTAssertEqual(.south, sut.orientation)
    }

    func testThreeTurnsRightLooksWest() {
        //Act
        sut.receiveCommands(generateCommands(.right, .right, .right))
        //Assert
        XCTAssertEqual(.west, sut.orientation)
    }

    func testFourTurnsRightLooksNorth() {
        //Act
        sut.receiveCommands(generateCommands(.right, .right, .right, .right))
        //Assert
        XCTAssertEqual(.north, sut.orientation)
    }

    func testTurnLeftLooksWest() {
        sut.receiveCommands(generateCommands(.left))
        //Assert
        XCTAssertEqual(.west, sut.orientation)
    }

    func testTwoTurnsLeftLooksSouth() {
        sut.receiveCommands(generateCommands(.left, .left))
        //Assert
        XCTAssertEqual(.south, sut.orientation)
    }

    func testThreeTurnsLeftLooksEast() {
        sut.receiveCommands(generateCommands(.left, .left, .left))
        //Assert
        XCTAssertEqual(.east, sut.orientation)
    }

    func testFourTurnsLeftLooksNorth() {
        sut.receiveCommands(generateCommands(.left, .left, .left, .left))
        //Assert
        XCTAssertEqual(.north, sut.orientation)
    }

    func testMoveForwardsIncreasesYWhenOrientationIsNorth() {
        sut.receiveCommands(generateCommands(.forward))
        //Assert
        XCTAssertEqual(6, sut.y)
    }

    func testMoveForwardsIncreasesYWhenOrientationIsNorthFromDifferentOrigin() {
        sut.y = 8
        //Assert
        sut.receiveCommands(generateCommands(.forward))
        XCTAssertEqual(9, sut.y)
    }

    func testMoveForwardsIncreasesXWhenOrientationIsEast() {
        sut.orientation = .east
        sut.receiveCommands(generateCommands(.forward))
        //Assert
        XCTAssertEqual(6, sut.x)
    }

    func testMoveForwardsIncreasesYWhenOrientationIsEastFromDifferentOrigin() {
        sut.orientation = .east
        sut.x = 10

        sut.receiveCommands(generateCommands(.forward))
        //Assert
        XCTAssertEqual(11, sut.x)
    }

    func testMoveForwardsDecreasesYWhenOrientationIsSouth() {
        sut.orientation = .south
        sut.receiveCommands(generateCommands(.forward))
        //Assert
        XCTAssertEqual(4, sut.y)
    }

    func testMoveForwardsDecreasesYWhenOrientationIsSouthFromDifferentOrigin() {
        sut.orientation = .south
        sut.y = 10
        //Assert
        sut.receiveCommands(generateCommands(.forward))
        XCTAssertEqual(9, sut.y)
    }

    func testMoveForwardsDecreasesXWhenOrientationIsWest() {
        sut.orientation = .west
        sut.receiveCommands(generateCommands(.forward))
        //Assert
        XCTAssertEqual(4, sut.x)
    }

    func testMoveForwardsDecreasesXWhenOrientationIsWestFromDifferentOrigin() {
        sut.orientation = .west
        sut.x = 6
        //Assert
        sut.receiveCommands(generateCommands(.forward))
        XCTAssertEqual(5, sut.x)
    }

    func testMoveForwardIsCancelledWhenThereIsAnObstacle() {
        //Arrange
        sut.obstacles = [Obstacle(x: 5, y: 6)]
        //Act
        sut.receiveCommands(generateCommands(.forward))
        //Assert
        XCTAssertEqual(5, sut.y)
    }

    func testDescriptionReturnsCurrentPosition() {
        //Arrange
        let currentPosition = "5,5,north"
        //Act
        let position = sut.description
        //Assert
        XCTAssertEqual(currentPosition, position)

    }

    func testDescriptionReturnsAlternatePosition() {
        //Arrange
        let currentPosition = "6,6,east"
        //Act
        sut.x = 6
        sut.y = 6
        sut.orientation = .east
        let position = sut.description
        //Assert
        XCTAssertEqual(currentPosition, position)

    }

    fileprivate func generateCommands(_ commands: Command...) -> String {
        let commandString = commands.compactMap { $0.rawValue }
        return String(commandString)
    }
}

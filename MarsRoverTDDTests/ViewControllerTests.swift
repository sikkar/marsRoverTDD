//
//  ViewControllerTests.swift
//  MarsRoverTDDTests
//
//  Created by Angel on 19/10/2018.
//  Copyright © 2018 Angel. All rights reserved.
//

import XCTest
@testable import MarsRoverTDD

class ViewControllerTests: XCTestCase {

    var sut: ViewController!
    var presenter: PresenterMock!

    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(withIdentifier: "MarsRoverViewController") as? ViewController
        presenter = PresenterMock()
        sut.presenter = presenter
    }

    override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
    }

    func testTextFieldChangesAndInformsPresenter() {
        //Arrange
        let cadena = "Hola amigo"
        _ = sut.view
        //Act
        sut.entryTextField.insertText(cadena)
        //Assert
        XCTAssertEqual(cadena, presenter.text)
    }

    class PresenterMock: MarsRoverPresenter {
        var text: String?

        override func commandHasChanged(command: String) {
            text = command
        }
    }
}

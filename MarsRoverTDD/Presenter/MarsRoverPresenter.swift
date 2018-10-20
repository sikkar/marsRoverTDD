//
//  MarsRoverPresenter.swift
//  MarsRoverTDD
//
//  Created by Angel on 19/10/2018.
//  Copyright © 2018 Angel. All rights reserved.
//

import Foundation

class MarsRoverPresenter {

    var view: MarsRoverView?
    var rover: Rover = Rover()
    var command: String?

    func viewIsReady() {
        view?.enableExecuteButton(false)
    }

    // MARK: Events
    func commandHasChanged(command: String) {
        self.command = command
        view?.enableExecuteButton(!command.isEmpty)
    }

    func mainButtonPressed() {
        rover.receiveCommands(command?.uppercased() ?? "")
        view?.showStatus(status: rover.description)
        view?.clearCommands()
        view?.enableExecuteButton(false)
    }

}

//
//  MarsRoverView.swift
//  MarsRoverTDD
//
//  Created by Angel on 19/10/2018.
//  Copyright © 2018 Angel. All rights reserved.
//

import Foundation

protocol MarsRoverView {
    func showStatus(status: String)
    func clearCommands()
    func enableExecuteButton(_ enable: Bool)
}

//
//  Rover.swift
//  MarsRoverTDD
//
//  Created by Angel on 22/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import Foundation

enum Orientation {
    case north, east, south, west
}

enum Command: Character {
    case right = "R"
    case left = "L"
    case forward = "F"
}

class Rover: CustomStringConvertible {

    var description: String {
        return "\(x),\(y),\(orientation)"
    }
    var orientation: Orientation = .north
    // swiftlint:disable identifier_name
    var x: Int = 5
    var y: Int = 5
    // swiftlint:enable identifier_name
    var obstacles: [Obstacle] = []

    func receiveCommands(_ commands: String) {
        for command in commands {
            guard let currentCommand = Command(rawValue: command) else {
                return
            }
            switch currentCommand {
            case .right:
                turnRight()
            case .left:
                turnLeft()
            case .forward:
                if !checkIfThereIsAnObstacleForward() {
                    moveForward()
                }
            }
        }
    }

    private func turnRight() {
        switch orientation {
        case .north:
            orientation = .east
        case .east:
            orientation = .south
        case .south:
            orientation = .west
        case .west:
            orientation = .north
        }
    }

    private func turnLeft() {
        switch orientation {
        case .north:
            orientation = .west
        case .west:
            orientation = .south
        case .south:
            orientation = .east
        case .east:
            orientation = .north
        }
    }

    private func moveForward() {
        switch orientation {
        case .north:
            y += 1
        case .east:
            x += 1
        case .south:
            y -= 1
        case .west:
            x -= 1
        }
    }

    private func checkIfThereIsAnObstacleForward() -> Bool {

        let futurePosition:(x:Int, y: Int)!

        switch orientation {
        case .north:
            futurePosition = (x: x, y: y+1)
        case .east:
            futurePosition = (x: x+1, y: y)
        case .south:
            futurePosition = (x: x, y: y-1)
        case .west:
            futurePosition = (x: x-1, y: y)
        }

        for obstacle in obstacles {
            if obstacle.x == futurePosition.x && obstacle.y == futurePosition.y {
                return true
            }
        }
        return false
    }
}

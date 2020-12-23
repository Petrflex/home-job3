//
//  main.swift
//  home-job3
//
//  Created by Petr Fedoseev on 21.12.2020.
//1
import Foundation


enum engineState {
    case start, stop
}

enum windowState {
    case open, close
}

enum trunkState {
    case full, empty
}

struct someCar {
    let brand : String
    let model : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "grey":
            self.color = "grey"
        case "black":
            self.color = "black"
        case "green":
            self.color = "green"
        case "white":
            self.color = "white"
        default:
            print("Input error.")
        }
    }
    let release : Int
    var trunkVolume : Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brand)\(model) trunk free: \(space)")
            } else { print("Input error or \(brand)\(model) trunk is full.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brand)\(model) engine is on")
            } else {print("\(brand)\(model) engine is off")}
        }
    }
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brand)\(model) windows are open")
            } else { print("\(brand)\(model) windows are close") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand)\(model) trunck is empty")
    }
}

struct someTruck {
    let brand : String
    let model : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "grey":
            self.color = "grey"
        case "black":
            self.color = "black"
        case "green":
            self.color = "green"
        case "white":
            self.color = "white"
        default:
            print("Input error.")
        }
    }
    let release : Int
    var bodyVolume : Double {
        willSet {
            if (trunkState == .empty) && (bodyVolume > 0) && (bodyVolume != 0) && (newValue < bodyVolume) {
                let space = bodyVolume - newValue
                print ("\(brand)\(model) trunk free: \(space)")
            } else { print("Input error or \(brand)\(model) trunk is full.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brand)\(model) engine is on")
            } else {print("\(brand)\(model) engine is off")}
        }
    }
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brand)\(model) windows are open")
            } else { print("\(brand)\(model) windows are close") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand)\(model) trunck is empty")
    }
}

var car01 = someCar(brand: "opel", model: "Astra", color: "clear", release: 2012, trunkVolume: 480.0 , engineState: .stop, windowState: .open, trunkState: .empty)
var car02 = someCar(brand: "Lada", model: "Granta", color: "clear", release: 2020, trunkVolume: 440.0, engineState: .stop, windowState: .close, trunkState: .full)

var truck1 = someTruck(brand: "Kamaz", model: "Master", color: "clear", release: 2018, bodyVolume: 100000.0, engineState: .start, windowState: .open, trunkState: .full)
var truck2 = someTruck(brand: "Kraz", model: "Big", color: "clear", release: 1989, bodyVolume: 150000.0, engineState: .start, windowState: .close, trunkState: .empty)


car01.engineState = .start
car01.trunkVolume = 360.0
car01.changeColor(c: "green")
car02.trunkVolume = 890.0
car02.emptyTrunck()
car02.trunkVolume = 80.9
car02.windowState = .open
car02.changeColor(c: "black")

truck1.engineState = .stop
truck1.windowState = .close
truck2.engineState = .stop
truck2.bodyVolume = 5678908


print ("Information about the first car: brand&model: \(car01.brand)\(car01.model), release: \(car01.release), color: \(String(describing: car01.color)), free trunkVolume: \(car01.trunkVolume), engine is \(car01.engineState)")




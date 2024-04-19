//
//  main.swift
//  homework-1
//
//  Created by Vladislav Mishukov on 10.04.2024.
//

import Foundation

var cars: [Car] = []
printMenuMessage()
while let input = readLine() {
    guard input != "quit" else {
        break
    }
    switch Int(input) ?? 0 {
    case 1:
        addNewCar()
        printMenuMessage()
    case 2:
        printCars(cars)
        printMenuMessage()
    case 3:
        printCarsByFilter()
        printMenuMessage()
    default:
        print(ActionMessages.wrongInput.rawValue)
    }
}

func printCars(_ cars: [Car]) {
    if cars.isEmpty {
        print(ActionMessages.noCarsYet.rawValue)
        return
    }
    cars.forEach{ car in
        print("Manufacturer: \(car.manufacturer)")
        print("Model: \(car.model)")
        print("Body: \(car.body.title)")
        if car.yearOfIssue == nil  {
            print("Year of issue: -")
        } else {
            print("Year of issue: \(car.yearOfIssue ?? 0)")
        }
        if let carNumber = car.carNumber {
            if !carNumber.isEmpty {
                print("Car number: \(carNumber)")
            }
        } else {
            print("")
            return
        }
        print("")
    }
}

func printCarsBodyType() {
    CarBody.allCases.forEach {
        print("\($0.rawValue)." + " " + "\($0.title)")
    }
}

func printMenuMessage() {
    StartAction.allCases.forEach {
        print("\($0.rawValue)")
    }
}

func printCarsByFilter() {
    print(ActionMessages.selectTheBody.rawValue)
    printCarsBodyType()
    guard let bodyNumber = Int(readLine() ?? "0")
    else {
        print(ActionMessages.wrongInput.rawValue)
        return
    }
    let body = CarBody(rawValue: bodyNumber)
    let filteredCars = cars.filter({$0.body == body})
    printCars(filteredCars)
}

func addNewCar() {
    print(ActionMessages.enterManufacturer.rawValue)
    let manufacturer = readLine()
    print(ActionMessages.enterModel.rawValue)
    let model = readLine()
    print(ActionMessages.enterBody.rawValue)
    printCarsBodyType()
    let bodyNumber = Int(readLine() ?? "") ?? 0
    let body = CarBody(rawValue: bodyNumber)
    print(ActionMessages.enterYearOfIssue.rawValue)
    let yearOfIssue = readLine()
    print(ActionMessages.enterCarNumber.rawValue)
    let carNumber = readLine()
    guard
        let manufacturer = manufacturer,
        let model = model,
        let body = body
    else {
        print(ActionMessages.wrongInput.rawValue)
        return
    }
    let newCar = Car(
        manufacturer: manufacturer,
        model: model,
        body: body,
        yearOfIssue: Int(yearOfIssue ?? ""),
        carNumber: carNumber
    )
    cars.append(newCar)
    print(ActionMessages.carAdded.rawValue)
}

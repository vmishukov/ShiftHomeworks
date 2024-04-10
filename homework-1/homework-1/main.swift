//
//  main.swift
//  homework-1
//
//  Created by Vladislav Mishukov on 10.04.2024.
//

import Foundation
var cars: [Car] = []
let menuMessage = "1. Add new Car \n2. Print all Cars \n3. Print Cars with specific body"
let carBodyTypeMessage = "1. City Car\n2. Hatchback \n3. SUV\n4. Convertible \n5. People Carrier"
print(menuMessage)
while let input = readLine() {
    guard input != "quit" else {
        break
    }
    switch Int(input) ?? 0 {
    case 1:
        addNewCar()
        print(menuMessage)
    case 2:
        printCars(cars)
        print(menuMessage)
    case 3:
        printCarsByFilter()
        print(menuMessage)
    default:
        print("Wrong input, try again")
    }
}

func printCars(_ cars: [Car]) {
    if cars.isEmpty {
        print("No cars yet!\n")
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

func printCarsByFilter() {
    print("Select the body")
    print(carBodyTypeMessage)
    let bodyNumber = readLine()
    let body: CarBody?
    switch Int(bodyNumber ?? "") ?? 0 {
    case 1:
        body = CarBody.cityCar
    case 2:
        body = CarBody.hatchback
    case 3:
        body = CarBody.suv
    case 4:
        body = CarBody.convertible
    case 5:
        body = CarBody.peopleCarrier
    default:
        body = nil
    }
    guard
        let body = body
    else {
        print("Invalid input, try again")
        return
    }
    let filteredCars = cars.filter({$0.body == body})
    printCars(filteredCars)
}

func addNewCar() {
    print("Enter manufacturer:")
    let manufacturer = readLine()
    print("Enter model:")
    let model = readLine()
    print("Select the body by entering the code")
    print(carBodyTypeMessage)
    let bodyNumber = readLine()
    print("Enter year of issue:")
    let yearOfIssue = readLine()
    print("Enter car number:")
    let carNumber = readLine()
    let body: CarBody?
    switch Int(bodyNumber ?? "") ?? 0 {
    case 1:
        body = CarBody.cityCar
    case 2:
        body = CarBody.hatchback
    case 3:
        body = CarBody.suv
    case 4:
        body = CarBody.convertible
    case 5:
        body = CarBody.peopleCarrier
    default:
        body = nil
    }
    guard
        let manufacturer = manufacturer,
        let model = model,
        let body = body
    else {
        print("Invalid input, try again")
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
    print("Car added!\n")
    
}

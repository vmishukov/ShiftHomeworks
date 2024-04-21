//
//  main.swift
//  homework-2
//
//  Created by Vladislav Mishukov on 19.04.2024.
//

import Foundation

let testArr = SafeArray<Int>(array: [])

let workerQueue = DispatchQueue (label: "com.bestkora.con", attributes: .concurrent)


workerQueue.async {
    for elem in 1...1000 {
        testArr.append(elem)
    }
  
}
workerQueue.async {
    for elem in 1...1000 {
        testArr.append(elem)
    }
  
}

sleep(5)
print(testArr.count())



//
//  main.swift
//  homework-2
//
//  Created by Vladislav Mishukov on 19.04.2024.
//

import Foundation

let testArr = SafeArray<Int>(array: [])

let workerQueue = DispatchQueue (label: "com.worker.queue", attributes: .concurrent)
let totalThreadIteration = 100

for value in 1...totalThreadIteration{
    workerQueue.async {
        testArr.append(value)
    }
}

for value in 1...totalThreadIteration-50{
    workerQueue.async {
        testArr.remove(at: value)
    }
}
sleep(2)
print(testArr.count())


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

for _ in 1...totalThreadIteration{
    workerQueue.async {
        print(testArr.count())
    }
}

for value in 1...totalThreadIteration-1{
    workerQueue.async {
        print(testArr.subscript(index: value) ?? "does not contained")
    }
}
for value in 1...totalThreadIteration-50{
    workerQueue.async {
        testArr.remove(at: value)
    }
}
for value in 1...totalThreadIteration{
    workerQueue.async {
        testArr.append(value)
    }
}

for _ in 1...totalThreadIteration{
    workerQueue.async {
        print(testArr.isEmpty())
    }
}
for value in 1...totalThreadIteration{
    workerQueue.async {
        print(testArr.contains(value))
    }
}

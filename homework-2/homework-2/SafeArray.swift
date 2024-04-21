//
//  SafeArray.swift
//  homework-2
//
//  Created by Vladislav Mishukov on 20.04.2024.
//

import Foundation

class SafeArray<T> {
    private var array: [T] = []
    private let accessQueue = DispatchQueue(label: "com.array.isolation", attributes: .concurrent)
    
    init(array: [T]) {
        self.accessQueue.async(flags: .barrier) {
            self.array = array
        }
    }
    
    func append(_ item: T) {
        self.accessQueue.async(flags: .barrier) {
            self.array.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.accessQueue.async(flags: .barrier) {
            if index <= self.count() {
                self.array.remove(at: index)
            }
        }
    }
    
    func `subscript`(index: Int) -> T?{
        var element: T?
        self.accessQueue.sync(flags: .barrier) {
            if index <= self.count() {
                element = self.array[index]
            }
        }
        return element
    }
    
    func contains(_ element: T) {
        // array.contains(where: {
        //     $0 == element
        // })
    }
    
    func isEmpty() -> Bool {
        var check = false
        workerQueue.sync {
            check = self.array.isEmpty
        }
        return check
    }
    
    func count() -> Int {
        var count = 0
        self.accessQueue.sync(flags: .barrier) {
            count = self.array.count
        }
        return count
    }
}

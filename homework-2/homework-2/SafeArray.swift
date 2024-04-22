//
//  SafeArray.swift
//  homework-2
//
//  Created by Vladislav Mishukov on 20.04.2024.
//
import Foundation

enum errors: String {
    case indexOutOfRange = "indexOutOfRange"
}

final class SafeArray<T> {
    // MARK: - private properties
    private var array: [T] = []
    private let accessQueue = DispatchQueue(label: "com.array.isolation", attributes: .concurrent)
    // MARK: -  properties
    var isEmpty: Bool {
        var check = false
        self.accessQueue.sync() {
            check = self.array.isEmpty
        }
        return check
    }
    
    var count: Int {
        var count = 0
        self.accessQueue.sync() {
            count = self.array.count
        }
        return count
    }
    // MARK: - init
    init(array: [T]) {
        self.accessQueue.async(flags: .barrier) {
            self.array = array
        }
    }
    // MARK: - public methods
    func append(_ item: T) {
        self.accessQueue.async(flags: .barrier) {
            self.array.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.accessQueue.async(flags: .barrier) {
            if index <= self.array.count-1 {
                self.array.remove(at: index)
            } else {
                print(errors.indexOutOfRange.rawValue)
            }
        }
    }
    
    func `subscript`(index: Int) -> T?{
        var element: T?
        self.accessQueue.sync() {
            if index <= self.array.count-1 {
                element = self.array[index]
            } else {
                print(errors.indexOutOfRange.rawValue)
            }
        }
        return element
    }
    
    func contains (_ element: T) -> Bool where T: Equatable {
        var check = false
        self.accessQueue.sync() {
            check = array.contains(where: {
                $0 == element
            })
        }
        return check
    }
}

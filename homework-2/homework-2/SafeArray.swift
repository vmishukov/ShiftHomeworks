//
//  SafeArray.swift
//  homework-2
//
//  Created by Vladislav Mishukov on 20.04.2024.
//
import Foundation
// MARK: - error enum
enum errors: String {
    case indexOutOfRange = "indexOutOfRange"
}
// MARK: - SafeArray Protocol

protocol SafeArrayProtocol {
    associatedtype T
    
    var isEmpty: Bool { get }
    var count: Int { get }
    
    func append(_ item: T)
    func remove(at index: Int)
    func `subscript`(index: Int) -> T?
}

protocol SafeArrayContainsProtocol {
    associatedtype T: Equatable
    func contains (_ element: T) -> Bool
}

final class SafeArray<T> : SafeArrayProtocol{
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
}
//MARK: - SafeArrayContainsProtocol
extension SafeArray : SafeArrayContainsProtocol where T: Equatable {
    func contains (_ element: T) -> Bool {
        var check = false
        self.accessQueue.sync() {
            check = array.contains(where: {
                $0 == element
            })
        }
        return check
    }
}

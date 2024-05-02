//
//  Storyboard.swift
//  homework-3
//
//  Created by Vladislav Mishukov on 01.05.2024.
//

import Foundation
import UIKit

enum Errors: Error {
    case ControllerNotFound
}

enum Storyboard: String {
    case Main
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>()throws -> T {
        let identifier = String(describing: T.self)
        guard let viewController = self.instance.instantiateViewController(withIdentifier: identifier) as? T else {
            throw Errors.ControllerNotFound
        }
        return viewController
    }
}

protocol Storyboarded {
    static func containingStoryboard() -> Storyboard
}

extension Storyboarded where Self: UIViewController {
    static func instantiate()throws -> Self {
        let controller: Self = try containingStoryboard().viewController()
        return controller
    }
}

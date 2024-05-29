//
//  SourceViewAssembly.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 21.05.2024.
//

import Foundation
import UIKit

final class SourceViewAssembly {

    struct Parameters {
        let sourceLink: String
    }

    static func makeModule(with dependencies: Parameters) -> UIViewController {
        SourceViewController(with: dependencies.sourceLink)
    }
}

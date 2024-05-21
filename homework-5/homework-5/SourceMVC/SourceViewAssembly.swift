//
//  SourceViewAssembly.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 21.05.2024.
//

import Foundation
import UIKit

final class SourceViewAssembly {
    //MARK: - Dependencies
    struct Dependencies {
        let sourceLink: String
    }
    //MARK: - makemodule
    static func makeModule(with dependencies: Dependencies) -> UIViewController {
        SourceViewController(with: dependencies.sourceLink)
    }
}

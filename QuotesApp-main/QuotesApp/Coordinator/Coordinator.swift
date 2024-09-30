//
//  Coordinator.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 16/02/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}


class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        print("App started")
        let vc = QodViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func gotoCategories() {
        let vc = QuotesCategoryViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func gotoCatQod() {
        let vc = CatQodViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
    
    
}


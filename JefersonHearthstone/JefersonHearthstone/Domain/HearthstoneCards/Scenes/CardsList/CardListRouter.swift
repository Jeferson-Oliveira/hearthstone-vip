//
//  CardListRouter.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation
import UIKit

protocol CardListRouterProtocol {
    func goToDetails(idCard: String)
}

class CardListRouter: CardListRouterProtocol {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToDetails(idCard: String) {
        navigationController.present(SceneFactory.buildCardDetailScene(cardId: idCard), animated: true)
    }
}

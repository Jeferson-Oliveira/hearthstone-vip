//
//  SceneFactory.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation
import UIKit

class SceneFactory {
    
    static func buildListCardScene(on: UINavigationController) -> CardListViewController {
        let presenter = CardsListPresenter()
        let interactor = CardListInteractor(presenter: presenter)
        let router = CardListRouter(navigationController: on)
        let viewController = CardListViewController(router: router, interactor: interactor)
        presenter.view = viewController
        return viewController
    }
    
     static func buildCardDetailScene(cardId: String) -> CardDetailViewController {
        let presenter = CardDetailPresenter()
        let interactor = CardDetailInteractor(presenter: presenter)
        let viewController = CardDetailViewController(cardId: cardId, interactor: interactor)
        presenter.view = viewController
        return viewController
    }
}

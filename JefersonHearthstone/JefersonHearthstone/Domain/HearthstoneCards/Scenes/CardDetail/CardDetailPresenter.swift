//
//  CardDetailPresenter.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation
import UIKit

protocol CardDetailPresentationLogic {
    func presentCardDetail(response: HeartStoneCards.DetailCard.Response)
}

class CardDetailPresenter: CardDetailPresentationLogic {
    weak var view: CardDetailDisplayLogic?
    
    func presentCardDetail(response: HeartStoneCards.DetailCard.Response) {
        switch response.cardsData {
        case .success(let cards):
            let firstCard = cards.first
            let viewModel = HeartStoneCards.DetailCard.ViewModel(name: firstCard?.name,
                                                                 shortDescription: firstCard?.text,
                                                                 flavor: firstCard?.flavor,
                                                                 imageUrl: URL(string: firstCard?.img ?? .empty),
                                                                 type: firstCard?.type,
                                                                 faction: firstCard?.faction,
                                                                 cost: firstCard?.cost?.description,
                                                                 atack: firstCard?.attack?.description,
                                                                 health: firstCard?.health?.description)
            
            view?.showCard(viewModel: viewModel)
        case .failure(let error):
            view?.showError(message: error.message)
        }
    }
}

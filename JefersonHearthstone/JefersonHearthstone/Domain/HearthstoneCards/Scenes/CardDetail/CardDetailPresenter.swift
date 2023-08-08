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
                                                                 type: formatItemDescription("type".localizable(), firstCard?.type),
                                                                 faction: formatItemDescription("faction".localizable(), firstCard?.faction),
                                                                 cost: formatItemDescription("cost".localizable(), firstCard?.cost?.description),
                                                                 atack: formatItemDescription("atack".localizable(), firstCard?.attack?.description),
                                                                 health: formatItemDescription("health".localizable(), firstCard?.health?.description))
            
            view?.showCard(viewModel: viewModel)
        case .failure(let error):
            view?.showError(message: error.message)
        }
    }
    
    func formatItemDescription(_ name: String,_ value: String?) -> String {
        return "\(name): \(value ?? .empty)"
    }
}

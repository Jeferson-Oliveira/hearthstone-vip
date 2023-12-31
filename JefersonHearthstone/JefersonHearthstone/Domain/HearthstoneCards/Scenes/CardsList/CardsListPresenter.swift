//
//  CardsListPresenter.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import UIKit

protocol CardListPresentationLogic {
    func presentCards(response: HeartStoneCards.ListAllCards.Response)
}

class CardsListPresenter: CardListPresentationLogic {
    weak var view: CardListDisplayLogic?
    
    func presentCards(response: HeartStoneCards.ListAllCards.Response) {        
        switch response.cardsData {
        case .success(let cards):
            let mappedCards = cards.filter { $0.img != nil }.map { card in
                return HeartStoneCards.ListAllCards.CardListItemViewModel(id: card.cardID,
                                                                          name: card.name,
                                                                          imageUrl: URL(string: card.img ?? .empty))
            }
            view?.showCards(viewModel: HeartStoneCards.ListAllCards.ViewModel(cards: mappedCards))
        case .failure(let error):
            view?.showError(message: error.message)
        }
    }
}

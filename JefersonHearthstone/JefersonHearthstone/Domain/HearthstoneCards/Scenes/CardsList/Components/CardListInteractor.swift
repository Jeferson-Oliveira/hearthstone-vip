//
//  CardListInteractor.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import UIKit

protocol CardListBusinessLogic {
    func getCards(request: HeartStoneCards.ListAllCards.Request)
}

class CardListInteractor: CardListBusinessLogic {
    
    private let apiWorker: APIWorkerProtocol
    var presenter: CardListPresentationLogic?
    
    init(apiWorker: APIWorkerProtocol = APIWorker(),
         presenter: CardListPresentationLogic) {
        self.apiWorker = apiWorker
        self.presenter = presenter
    }
    
    func getCards(request: HeartStoneCards.ListAllCards.Request) {
        presenter?.showLoading()
        if request.name.isEmpty{
            apiWorker.getCards(completion: handlerGetCardsCompletion(_:))
        } else {
            apiWorker.searchCards(withName: request.name , completion: handlerGetCardsCompletion(_:))
        }
    }
    
    func handlerGetCardsCompletion(_ result: Result<[Card], NetworkError>) {
        self.presenter?.hideLoading()
        self.presenter?.presentCards(response: HeartStoneCards.ListAllCards.Response(cardsData: result))
    }
}

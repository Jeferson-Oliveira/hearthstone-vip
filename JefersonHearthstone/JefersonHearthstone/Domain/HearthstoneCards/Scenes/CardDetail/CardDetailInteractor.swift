//
//  CardDetailInteractor.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation

protocol CardDetailBusinessLogic {
    func fetchCard(request: HeartStoneCards.DetailCard.Request)
}

class CardDetailInteractor: CardDetailBusinessLogic {
    
    private let apiWorker: APIWorkerProtocol
    var presenter: CardDetailPresentationLogic?
    
    init(apiWorker: APIWorkerProtocol = APIWorker(),
         presenter: CardDetailPresentationLogic) {
        self.apiWorker = apiWorker
        self.presenter = presenter
    }
    
    func fetchCard(request: HeartStoneCards.DetailCard.Request) {
        presenter?.showLoading()
        apiWorker.getCardDetail(cardId: request.itemId, completion: handlerGetCardsCompletion(_:))
       
    }
    
    func handlerGetCardsCompletion(_ result: Result<[Card], NetworkError>) {
        self.presenter?.hideLoading()
        self.presenter?.presentCards(response: HeartStoneCards.DetailCard.Response(cardsData: result))
    }
}

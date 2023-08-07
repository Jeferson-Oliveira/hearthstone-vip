//
//  Spies.swift
//  JefersonHearthstoneTests
//
//  Created by Jeferson de Jesus on 07/08/23.
//

import Foundation
@testable import JefersonHearthstone

class CardListViewPresenterSpy: CardListDisplayLogic {
    var showErrorCalled = false
    var showCardsCalled = false
    
    func showError(message: String) {
        showErrorCalled = true
    }
    
    func showCards(viewModel: JefersonHearthstone.HeartStoneCards.ListAllCards.ViewModel) {
        showCardsCalled = true
    }
}

class CardListInteractorSpy: CardListBusinessLogic {
    var getCardsCalled = false
    func getCards(request: JefersonHearthstone.HeartStoneCards.ListAllCards.Request) {
        getCardsCalled = true
    }
}

class CardListRouterSpy: CardListRouterProtocol {
    var goToDetailsCalled = false
    func goToDetails(idCard: String) {
        goToDetailsCalled = true
    }
}

class CardListPresenterSpy: CardListPresentationLogic {
    var presentCardsCalled = false
    func presentCards(response: JefersonHearthstone.HeartStoneCards.ListAllCards.Response) {
        presentCardsCalled = true
    }
}


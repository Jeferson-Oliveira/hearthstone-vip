//
//  Spies.swift
//  JefersonHearthstoneTests
//
//  Created by Jeferson de Jesus on 07/08/23.
//

import Foundation
@testable import JefersonHearthstone

class CardDetailPresenterSpy: CardDetailPresentationLogic {
    var presentDetailsCalled = false
    func presentCardDetail(response: HeartStoneCards.DetailCard.Response) {
        presentDetailsCalled = true
    }
}

class CardDetailInteractorSpy: CardDetailBusinessLogic {
    var fetchCardCalled = false
    func fetchCard(request: JefersonHearthstone.HeartStoneCards.DetailCard.Request) {
        fetchCardCalled = true
    }
}

class CardDetailViewSpy: CardDetailDisplayLogic {
    var showErrorCalled = false
    var showCardCalled = false
    
    func showError(message: String) {
        showErrorCalled = true
    }
    
    func showCard(viewModel: JefersonHearthstone.HeartStoneCards.DetailCard.ViewModel) {
        showCardCalled = true
    }
}

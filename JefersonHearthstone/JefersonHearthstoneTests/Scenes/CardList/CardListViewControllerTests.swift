//
//  CardListViewControllerTests.swift
//  JefersonHearthstoneTests
//
//  Created by Jeferson de Jesus on 07/08/23.
//

import Foundation
import XCTest

@testable import JefersonHearthstone

final class CardListViewControllerTests: XCTestCase {
    
    var sut: CardListViewController?
    var routerSpy = CardListRouterSpy()
    var interactorSpy = CardListInteractorSpy()
    
    override func setUp() {
        sut = CardListViewController(router: routerSpy,
                                     interactor: interactorSpy)
    }
    
    override func tearDown() {
        sut = nil
        routerSpy = CardListRouterSpy()
        interactorSpy = CardListInteractorSpy()
    }

    func testCallToListCards() throws {
        sut?.fetchCards()
        XCTAssertTrue(interactorSpy.getCardsCalled)
    }
    
    func testCallToDetailCards() throws {
        let cardMock = Card.mock()
        
        let _ = sut?.view
        sut?.viewModel = HeartStoneCards.ListAllCards.ViewModel(cards: [HeartStoneCards.ListAllCards.CardListItemViewModel(id: cardMock.cardID,
                                                                                                                           name: cardMock.name,
                                                                                                                           imageUrl: URL(string: cardMock.img ?? .empty))])
        
        sut?.collectionView(sut?.mainView.collectionView ?? UICollectionView(),
                            didSelectItemAt: IndexPath(row: 0, section: 0))

        XCTAssertTrue(routerSpy.goToDetailsCalled)
    }

}

//
//  CardListPresenterTests.swift
//  JefersonHearthstoneTests
//
//  Created by Jeferson de Jesus on 07/08/23.
//

import Foundation
import XCTest

@testable import JefersonHearthstone

class CardListPresenterTests: XCTestCase {
    
    var sut: CardsListPresenter?
    var viewSpy = CardListViewPresenterSpy()
    
    override func setUp() {
        sut = CardsListPresenter()
        sut?.view = viewSpy
    }
    
    override func tearDown() {
        sut = nil
        viewSpy = CardListViewPresenterSpy()
    }
    
    func testShouldCallShowCards() {
        let mockSuccess = Result<[Card], NetworkError>.success([Card.mock()])
        sut?.presentCards(response: HeartStoneCards.ListAllCards.Response(cardsData: mockSuccess))
                
        XCTAssertTrue(viewSpy.showCardsCalled)
        XCTAssertFalse(viewSpy.showErrorCalled)
    }
    
    func testShouldCallShowError() {
        let mockError = Result<[Card], NetworkError>.failure(.init(code: -1, message: "mock"))
        sut?.presentCards(response: HeartStoneCards.ListAllCards.Response(cardsData: mockError))
                
        XCTAssertFalse(viewSpy.showCardsCalled)
        XCTAssertTrue(viewSpy.showErrorCalled)
        
    }
    
}

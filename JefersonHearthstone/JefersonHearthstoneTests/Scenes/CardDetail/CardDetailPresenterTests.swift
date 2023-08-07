//
//  CardDetailPresenterTests.swift
//  JefersonHearthstoneTests
//
//  Created by Jeferson de Jesus on 07/08/23.
//

import Foundation
import XCTest

@testable import JefersonHearthstone

class CardDetailPresenterTests: XCTestCase {
    
    var sut: CardDetailPresenter?
    var viewSpy = CardDetailViewSpy()
    
    override func setUp() {
        sut = CardDetailPresenter()
        sut?.view = viewSpy
    }
    
    override func tearDown() {
        sut = nil
        viewSpy = CardDetailViewSpy()
    }
    
    func testShouldCallShowCard() {
        let mockSuccess = Result<[Card], NetworkError>.success([Card.mock()])
        sut?.presentCardDetail(response: HeartStoneCards.DetailCard.Response(cardsData: mockSuccess))
                
        XCTAssertTrue(viewSpy.showCardCalled)
        XCTAssertFalse(viewSpy.showErrorCalled)
    }
    
    func testShouldCallShowError() {
        let mockError = Result<[Card], NetworkError>.failure(.init(code: -1, message: "mock"))
        sut?.presentCardDetail(response: HeartStoneCards.DetailCard.Response(cardsData: mockError))
        XCTAssertFalse(viewSpy.showCardCalled)
        XCTAssertTrue(viewSpy.showErrorCalled)
        
    }
    
}

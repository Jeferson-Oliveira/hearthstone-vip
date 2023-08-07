//
//  CardListInteractorTests.swift
//  JefersonHearthstoneTests
//
//  Created by Jeferson de Jesus on 07/08/23.
//

import Foundation
import XCTest

@testable import JefersonHearthstone

class CardListInteractorTests: XCTestCase {
    
    var sut: CardListInteractor?
    var presenterSpy = CardListPresenterSpy()
    var apiWorkerSpy = APIWorkerSpy()
    
    override func setUp() {
        sut = CardListInteractor(apiWorker: apiWorkerSpy,
                                 presenter: presenterSpy)
    }
    
    override func tearDown() {
        sut = nil
        presenterSpy = CardListPresenterSpy()
        apiWorkerSpy = APIWorkerSpy()
    }
    
    func testLisCardsRequestWithTerm() {
        sut?.getCards(request: HeartStoneCards.ListAllCards.Request(name: "test"))
    
        XCTAssertTrue(apiWorkerSpy.searchCardsCalled)
        XCTAssertEqual(apiWorkerSpy.searchTerm, "test")
        XCTAssertTrue(presenterSpy.presentCardsCalled)
    }
    
    func testListCardsWihtoutTerm() {
        sut?.getCards(request: HeartStoneCards.ListAllCards.Request(name: .empty))
    
        XCTAssertTrue(apiWorkerSpy.getCardsCalled)
        XCTAssertNil(apiWorkerSpy.searchTerm)
        XCTAssertTrue(presenterSpy.presentCardsCalled)
    }
        
}


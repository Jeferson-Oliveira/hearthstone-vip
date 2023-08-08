//
//  CardDetailInteractorTests.swift
//  JefersonHearthstoneTests
//
//  Created by Jeferson de Jesus on 07/08/23.
//

import Foundation
import XCTest

@testable import JefersonHearthstone

class CardDetailInteractorTests: XCTestCase {
    
    var sut: CardDetailInteractor?
    var presenterSpy = CardDetailPresenterSpy()
    var apiWorkerSpy = APIWorkerSpy()
    
    override func setUp() {
        sut = CardDetailInteractor(apiWorker: apiWorkerSpy,
                                   presenter: presenterSpy)
    }
    
    override func tearDown() {
        sut = nil
        presenterSpy = CardDetailPresenterSpy()
        apiWorkerSpy = APIWorkerSpy()
    }
    
    func testLisCardsRequestWithTerm() {
        sut?.fetchCard(request: HeartStoneCards.DetailCard.Request(itemId: "1234"))
        
        XCTAssertTrue(apiWorkerSpy.getCardDetailCalled)
        XCTAssertEqual(apiWorkerSpy.cardId, "1234")
        XCTAssertTrue(presenterSpy.presentDetailsCalled)
    }
        
}

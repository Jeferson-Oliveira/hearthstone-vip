//
//  CardListRouterTests.swift
//  JefersonHearthstoneTests
//
//  Created by Jeferson de Jesus on 07/08/23.
//

import Foundation
import XCTest

@testable import JefersonHearthstone

class CardListRouterTests: XCTestCase {
    var sut: CardListRouter?
    var navSpy = UINavigationControllerSpy()
    
    override func setUp() {
        sut = CardListRouter(navigationController: navSpy)
    }
    
    override func tearDown() {
        sut = nil
        navSpy = UINavigationControllerSpy()
    }
    
    func testRouterToDetails() {
        sut?.goToDetails(idCard: "mock")
        XCTAssertTrue(navSpy.presentCalled)
        XCTAssertTrue(navSpy.presentedController is CardDetailViewController)
    }
}

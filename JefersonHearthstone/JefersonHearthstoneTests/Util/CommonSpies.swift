//
//  CommonSpies.swift
//  JefersonHearthstoneTests
//
//  Created by Jeferson de Jesus on 07/08/23.
//

import Foundation
import UIKit

@testable import JefersonHearthstone

//MARK: APIWorkerSpy
class APIWorkerSpy: APIWorkerProtocol {
    var shouldReturnSuccess = true
    
    var getCardsCalled = false
    var searchCardsCalled = false
    var getCardDetailCalled = false

    var searchTerm: String?
    var cardId: String?
    
    func getCards(completion: @escaping (Result<[JefersonHearthstone.Card], JefersonHearthstone.NetworkError>) -> Void) {
        getCardsCalled = true
        if shouldReturnSuccess {
            completion(.success([Card.mock()]))
        } else {
            completion(.failure(NetworkError(code: 1, message: "Error")))
        }
    }
    
    func searchCards(withName: String, completion: @escaping (Result<[JefersonHearthstone.Card], JefersonHearthstone.NetworkError>) -> Void) {
        searchCardsCalled = true
        searchTerm = withName
        
        if shouldReturnSuccess {
            completion(.success([Card.mock()]))
        } else {
            completion(.failure(NetworkError(code: 1, message: "Error")))
        }
    }
    
    func getCardDetail(cardId: String, completion: @escaping (Result<[JefersonHearthstone.Card], JefersonHearthstone.NetworkError>) -> Void) {
        self.cardId = cardId
        getCardDetailCalled = true
        
        if shouldReturnSuccess {
            completion(.success([Card.mock()]))
        } else {
            completion(.failure(NetworkError(code: 1, message: "Error")))
        }
    }
}

//MARK: UINavigationControllerSpy
class UINavigationControllerSpy: UINavigationController {
    var presentCalled = false
    var presentedController: UIViewController?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentCalled = true
        presentedController = viewControllerToPresent
    }
}

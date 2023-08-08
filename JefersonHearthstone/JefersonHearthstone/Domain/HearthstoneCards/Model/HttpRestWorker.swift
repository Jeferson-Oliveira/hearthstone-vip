//
//  APIWorker.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation
import Alamofire

protocol APIWorkerProtocol {
    func getCards(completion: @escaping (Result<[Card], NetworkError>) -> Void)
    func searchCards(withName: String, completion: @escaping (Result<[Card], NetworkError>) -> Void)
    func getCardDetail(cardId: String, completion: @escaping (Result<[Card], NetworkError>) -> Void)
}

class APIWorker: APIWorkerProtocol {
    
    private let sessionManager = Alamofire.Session.default
    
    func getCards(completion: @escaping (Result<[Card], NetworkError>) -> Void) {
        request(endpoint: Endpoints.listClassicCards, completion: completion)
    }
    
    func searchCards(withName: String, completion: @escaping (Result<[Card], NetworkError>) -> Void) {
        request(endpoint: Endpoints.searchCards + withName, completion: completion)
    }
    
    func getCardDetail(cardId: String, completion: @escaping (Result<[Card], NetworkError>) -> Void) {
        request(endpoint: Endpoints.detailCard + cardId, completion: completion)
    }
    
    private func request<T: Codable>(endpoint: String,
                                     method: HTTPMethod = .get,
                                     parameters: Parameters? = nil,
                                     completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        self.sessionManager
            .request(endpoint, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: HTTPHeaders(Endpoints.defaultHeaders))
            .responseDecodable(of: T.self, completionHandler: { response in
                switch response.result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(NetworkError(code: error.responseCode ?? 500, message: error.localizedDescription)))
                }
            })
    }
}

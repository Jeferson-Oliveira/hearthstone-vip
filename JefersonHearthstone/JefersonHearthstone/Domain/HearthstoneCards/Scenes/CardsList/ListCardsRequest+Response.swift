//
//  ListCardsRequest+Response.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation

enum HeartStoneCards {
    enum ListAllCards {
        struct Request {
            let name: String
        }
        
        struct Response {
            let cardsData: Result<[Card], NetworkError>
        }
        
        struct ViewModel {
            let cards: [CardListItemViewModel]
        }
        
        struct CardListItemViewModel {
            let id: String?
            let name: String?
            let imageUrl: URL?
        }
        
    }
}

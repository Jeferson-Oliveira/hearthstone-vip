//
//  Card.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation

struct Card: Codable {
    let cardID: String?
    let dbfID: Int?
    let name, cardSet, type, rarity: String?
    let cost, attack, health: Int?
    let text, artist, race, playerClass: String?
    let img: String?

    enum CodingKeys: String, CodingKey {
        case cardID = "cardId"
        case dbfID = "dbfId"
        case name, cardSet, type, rarity, cost, attack, health, text, artist, race, playerClass, img
    }
}

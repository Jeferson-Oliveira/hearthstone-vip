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
    let text, artist, faction, race, playerClass, flavor: String?
    let img: String?

    enum CodingKeys: String, CodingKey {
        case cardID = "cardId"
        case dbfID = "dbfId"
        case name, cardSet, type, rarity,faction, cost, attack, health, flavor, text, artist, race, playerClass, img
    }
}

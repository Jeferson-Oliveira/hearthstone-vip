//
//  CardMock.swift
//  JefersonHearthstoneTests
//
//  Created by Jeferson de Jesus on 07/08/23.
//

import Foundation

@testable import JefersonHearthstone

extension Card {
    static func mock() -> Card {
        return .init(cardID: "CORE_CS2_092",
                     dbfID: 69530,
                     name: "Blessing of Kings",
                     cardSet: "Core",
                     type: "Spell",
                     rarity: "Common",
                     cost: 4,
                     attack: 10,
                     health: 100,
                     text: "Give a minion +4/+4. <i>(+4 Attack/+4 Health)</i>",
                     artist: "Lucas Graciano",
                     faction: "Neutral",
                     race: "Mock",
                     playerClass: "Mock",
                     flavor: "Mock",
                     img: "mock")
    }
}

//
//  Endpoints.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation

struct Endpoints {
    
    private static let  baseURL = "https://omgvamp-hearthstone-v1.p.rapidapi.com/"
    static let defaultHeaders = [
        "X-RapidAPI-Key": "f0f75d8980mshc9a8f67289d6c5cp125b32jsn4eab555f2da6",
        "X-RapidAPI-Host": "omgvamp-hearthstone-v1.p.rapidapi.com"
    ]
    
    static let listClassicCards = baseURL + "cards/sets/Classic"
    static let searchCards = baseURL + "cards/search/"
    static let detailCard = baseURL + "cards/"

}

struct NetworkError: Error {
    let code: Int 
    let message: String
}


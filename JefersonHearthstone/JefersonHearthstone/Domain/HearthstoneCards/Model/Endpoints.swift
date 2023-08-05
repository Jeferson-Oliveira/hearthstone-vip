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
        "X-RapidAPI-Key": "",
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


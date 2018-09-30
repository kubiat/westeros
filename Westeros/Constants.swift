//
//  constants.swift
//  Westeros
//
//  Created by Joaquín Gracia López on 18/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//

import Foundation

enum Constants{
    static let houseDidChangeNotificationName = "HouseDidChange"
    static let houseKey = "HouseKey"
    static let lastHouseKey = "lastHouseKey"

    static let seasonDidChangeNotificationName = "SeasonDidChange"
    static let seasonKey = "SeasonKey"
    static let lastSeasonKey = "lastSeasonKey"
    
    static let personKey = "PersonKey"
    static let pesonDidChangeNotificationName = "PersonDidChange"
}

enum HouseName: String {
    case stark = "Stark"
    case lannister = "Lannister"
    case targaryen = "Targaryen"
    case tyrell = "Tyrell"
}

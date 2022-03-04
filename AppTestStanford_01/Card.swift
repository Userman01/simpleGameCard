//
//  Card.swift
//  AppTestStanford_01
//
//  Created by Петр Постников on 03.03.2022.
//

import Foundation

struct Card{
    var isFaseUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierNumber = 0
    static func identifierCreator() -> Int{
        identifierNumber += 1
        return identifierNumber
    }
    init(){
        self.identifier = Card.identifierNumber
    }
}


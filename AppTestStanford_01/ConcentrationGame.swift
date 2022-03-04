//
//  ConcentrationGame.swift
//  AppTestStanford_01
//
//  Created by Петр Постников on 03.03.2022.
//

import Foundation

class ConcentrationGame{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceCard:Int?
    init(numberCarcouple: Int){
        for _ in 1...numberCarcouple {
            var card = Card()
            card.identifier = Card.identifierCreator()
            self.cards += [card, card]
        }
        self.cards.shuffle()
    }
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceCard, matchingIndex != index{
                if cards[matchingIndex].identifier == cards[index].identifier{
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaseUp = true
                indexOfOneAndOnlyFaceCard = nil
            } else {
                for flipDown in cards.indices{
                    if !cards[flipDown].isMatched{
                        cards[flipDown].isFaseUp = false
                    }
                }
                indexOfOneAndOnlyFaceCard = index
                cards[index].isFaseUp = true
            }
        }
    }
    
    func examination() -> Bool{
        var count = 0
        for i in cards{
            if !i.isMatched{
                count += 1
            }
        }
        if count == 0 {
            return true
        }else{
            return false
        }
    }
    
    func updateView(){
        for item in cards.indices {
            self.cards[item].isMatched = false
            self.cards[item].isFaseUp = false
        }
        self.cards.shuffle()
    }
}


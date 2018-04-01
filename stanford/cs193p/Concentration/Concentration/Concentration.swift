//
//  Concentration.swift
//  Concentration
//
//  Created by chen peixie on 3/31/18.
//  Copyright © 2018 akanchi. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func reset() {
        var tmpCards = cards
        cards = [Card]()
        while tmpCards.count > 0 {
            var c = tmpCards.remove(at: tmpCards.count.arc4random)
            c.isFaceUp = false
            c.isMatched = false
            cards += [c]
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        var tmpCards = [Card]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            tmpCards += [card, card]
        }
        
        while tmpCards.count > 0 {
            cards += [tmpCards.remove(at: tmpCards.count.arc4random)]
        }
    }
}

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
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        cards[index].isFaceUp = !cards[index].isFaceUp
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true;
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func reset() {
        var tmpCards = cards
        cards = [Card]()
        while tmpCards.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(tmpCards.count)))
            var c = tmpCards.remove(at: randomIndex)
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
            let randomIndex = Int(arc4random_uniform(UInt32(tmpCards.count)))
            cards += [tmpCards.remove(at: randomIndex)]
        }
    }
}

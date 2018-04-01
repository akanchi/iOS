//
//  ViewController.swift
//  Concentration
//
//  Created by chen peixie on 3/31/18.
//  Copyright © 2018 akanchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var game =  Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return ((cardButtons.count + 1) / 2)
    }

    private(set) var filpCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedStringKey:Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 1, green: 0.6360918044, blue: 0.009636295493, alpha: 1)
        ]
        let attributeString = NSAttributedString(string: "Flips: \(filpCount)", attributes: attributes)
        flipCountLabel.attributedText = attributeString
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        filpCount += 1
        if let cardNumber = cardButtons.index(of:sender) {
            print("cardNumber = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction private func onRestart(_ sender: UIButton) {
        game.reset()
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for:UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for:UIControlState.normal)
                if card.isMatched {
                    button.isUserInteractionEnabled = false
                    button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                } else {
                    button.isUserInteractionEnabled = true
                    button.backgroundColor = #colorLiteral(red: 1, green: 0.6360918044, blue: 0.009636295493, alpha: 1)
                }
            }
        }
    }
    
//    private var emojiChoices = ["👻", "👺", "🎃", "😻", "🤡", "💩", "😝", "🤓"]
    private var emojiChoices = "👻👺🎃😻🤡💩😝🤓"
    
    private var emoji = Dictionary<Card, String>()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        
        return emoji[card] ?? "?"
    }
}

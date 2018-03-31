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

    var filpCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(filpCount)"
        }
    }
    
    let emojiChoices = ["👻", "🎃", "🎃", "👻"]
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        filpCount += 1
        if let cardNumber = cardButtons.index(of:sender) {
            print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }
    }

    func flipCard(withEmoji emoji:String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for:UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.6360918044, blue: 0.009636295493, alpha: 1)
        } else {
            button.setTitle(emoji, for:UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}


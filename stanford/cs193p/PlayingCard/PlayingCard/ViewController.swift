//
//  ViewController.swift
//  PlayingCard
//
//  Created by chen peixie on 4/6/18.
//  Copyright © 2018 akanchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by chen peixie on 4/7/18.
//  Copyright © 2018 akanchi. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    let themes = [
        "Sports": "🤾‍♀️🏄‍♀️🚵‍♀️🤽‍♀️⛹️‍♀️🚴‍♀️⚽️🎱🥋🥊🏸🏋️‍♂️",
        "Animals": "🦓🦒🦔🦕🦖🦗🕊🐅🐊🐎🐔🙊🐡",
        "Faces": "🤧😤🤣😥😡🤓😓🤕🤡😴🙁🙂",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Choose Theme" {
            if let button = sender as? UIButton {
                if let themeName = button.currentTitle {
                    if let theme = themes[themeName] {
                        if let cvc = segue.destination as? ConcentrationViewController {
                            cvc.theme = theme
                        }
                    }
                }
            }
        }
    }

}

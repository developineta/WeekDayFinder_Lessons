//
//  InfoViewController.swift
//  WeekDayFinder
//
//  Created by ineta.magone on 15/11/2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var appDescLabel: UILabel!
    @IBOutlet weak var emojiButton: UIButton!
    @IBOutlet weak var emojiOutput: UILabel!
    
    var infoText = String()
    var myEmoji = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !infoText.isEmpty{
            appDescLabel.text = infoText
        }
    }
    
    // Shows emoji when button pressed
    @IBAction func pressForEmoji(_ sender: Any) {
        displayEmoji()
    }
    
    func displayEmoji(){
        //guard let showSmiley = String?(myEmoji.text!) else {return}
        
        if !myEmoji.isEmpty{
            emojiOutput.text = myEmoji
        }
    }
}

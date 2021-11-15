//
//  InfoViewController.swift
//  WeekDayFinder
//
//  Created by ineta.magone on 15/11/2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var appDescLabel: UILabel!
    @IBOutlet weak var dayTranslate: UIButton!
    
    var infoText = String()
    var dayInFrench = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !infoText.isEmpty{
            appDescLabel.text = infoText
        }
    }
}

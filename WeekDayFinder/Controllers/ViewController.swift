//
//  ViewController.swift
//  WeekDayFinder
//
//  Created by ineta.magone on 13/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func findButtonTapped(_ sender: Any) {
        let calendar = Calendar.current
        var dateComponets = DateComponents()
        
        guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!) else {
            warningAlert(withTitle: "Input Error!", withMessage: "Date Text Fields can't be empty.")
            return
        }
        
        dateComponets.day = day
        dateComponets.month = month
        dateComponets.year = year
        
        guard let date = calendar.date(from: dateComponets) else {return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        switch findButton.titleLabel?.text{
        case "FIND":
            findButton.setTitle("CLEAR", for: .normal)
            //31 February
            if day >= 1 && day <= 31 && month >= 1 && month <= 12{
                let weekday = dateFormatter.string(from: date)
                resultLabel.text = weekday.capitalized
            }else{
                warningAlert(withTitle: "Error!", withMessage: "Wrong Date, please enter the correct Date!")
            }
        default:
            findButton.setTitle("FIND", for: .normal)
            //clear
            clearTextFields()
        }
    }
    
    func clearTextFields(){
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Press Find To Search for Your Day"
    }
    
    func warningAlert(withTitle title: String?, withMessage message: String?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "day"{
            // Get the new view controller using segue.destination.
            let vc = segue.destination as! InfoViewController // vc as Vue Controller
            // Pass the selected object to the new view controller.
            vc.infoText = "DayFinder helps you to find weekday for a given date!"
            
            vc.myEmoji = "🤩"
        }
    }
}

//
//  MarksEntryVC.swift
//  Grading
//
//  Created by Ramachandra petla on 10/17/22.
//

import UIKit

class MarksEntryVC: UIViewController {
    
    @IBOutlet weak var marksTextLabel: UILabel!
    @IBOutlet weak var marksTextField: UITextField!
    @IBOutlet weak var infoTextLabel: UILabel!
    
    var entryField = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        marksTextLabel.text = "Enter marks for \(entryField)"
        
        let savedData = UserDefaults.standard.double(forKey: entryField)
        if(savedData != 0) {
            marksTextField.text = String(savedData - 1);
        }
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitMarks(_ sender: Any) {
        if(marksTextField.text != nil) {
            let fieldValue: Double? = Double(marksTextField.text!)
            var val = fieldValue ?? 0
            if(val >= 1 && val <= 101) {
                infoTextLabel.text = ""
                val = val + 1.0
                UserDefaults.standard.set(val, forKey: entryField)
                self.navigationController?.popViewController(animated: true)
            } else {
                infoTextLabel.text = "Enter marks in range [0 - 100]"
            }
            
        } else {
            infoTextLabel.text = "Enter marks to submit"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

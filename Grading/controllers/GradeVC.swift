//
//  GradeVC.swift
//  Grading
//
//  Created by Ramachandra petla on 10/17/22.
//

import UIKit

class GradeVC: UIViewController {

    @IBOutlet weak var marksLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calculateGrade(score: caluclateMarks())
    }
    
    func caluclateMarks()->Double {
        var finalScore = 0.0
        var marks = 0.0
        
        //Assignment Marks
        for i in 1...5 {
            marks += getValueFromUserDefaults(key: "Assignment\(i)")
        }
        
        finalScore += (marks/5.0)*0.25
        
        //Midterm Exam
        marks =  getValueFromUserDefaults(key: "Midterm Exam")
        finalScore += marks*0.2
        
        //Final Exam
        marks = getValueFromUserDefaults(key: "Final Exam")
        finalScore += marks*0.25
        
        //Project
        marks = getValueFromUserDefaults(key: "Project")
        finalScore += marks*0.30
        finalScore = round(finalScore*10)/10.0
        marksLabel.text = String(finalScore)
        return finalScore;
    }
    
    func getValueFromUserDefaults(key: String) -> Double {
        var marks = 0.0
        marks = UserDefaults.standard.double(forKey: key)
        if marks != 0 {
            marks = marks-1
        }
        return marks
            
    }
    
    func calculateGrade(score: Double) {
        var grade = ""
        switch score {
            case 91.0...100.0:
                grade = "A"
            case 89.0...90.9:
                grade = "A-"
            case 86.0...88.9:
                grade = "B+"
            case 82.0...85.9:
                grade = "B"
            case 79.0...81.9:
                grade = "B-"
            case 76.0...78.9:
                grade = "C+"
            case 72.0...75.9:
                grade = "C"
            case 70.0...71.9:
                grade = "C-"
            case 60.0...69.9:
                grade = "D"
            default:
                grade = "F"
        }
        gradeLabel.text = grade
        
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

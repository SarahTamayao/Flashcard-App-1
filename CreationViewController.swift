//
//  CreationViewController.swift
//  Flashcard App
//
//  Created by Keren Razo on 3/19/22.
//

import UIKit

class CreationViewController: UIViewController {
    var flashcardsController: ViewController!
    
    
    @IBOutlet weak var QuestionField: UITextField!
    
    
    @IBOutlet weak var AnswerField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = QuestionField.text
        
        let answerText = AnswerField.text
        
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        dismiss(animated: true)
        
        
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

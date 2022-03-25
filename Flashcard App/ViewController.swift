//
//  ViewController.swift
//  Flashcard App
//
//  Created by Keren Razo on 2/26/22.
//

import UIKit

struct Flashcard{
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    //Array to hold flashcards
    var flashcards = [Flashcard]()
    
    //Current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            updateFlashcard(question: "How old is the Earth?", answer: "4.5 billion years")
        }
        
    }

    @IBAction func didtTapOnFlashcard(_ sender: Any) {
        frontLabel.isHidden=true;
    
        
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
     
        currentIndex = currentIndex - 1
        
        //Update labels
        updateLabels()
        
        //update buttons
        updateNextPrevButtons()
    }
    
    
    @IBAction func didTapOnNext(_ sender: Any) {
        //Increase current index
        currentIndex = currentIndex + 1
        
        //Update labels
        updateLabels()
        
        //Update buttons
        updateNextPrevButtons()
        
    }
    
    
    func updateFlashcard(question: String, answer: String) {
        let flashcard = Flashcard(question: question, answer: answer)
        
        flashcards.append(flashcard)
        
        print("Added new flashcard!!")
        print("We now have \(flashcards.count) flashcards")
        
        //update current index
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        //update buttons
        updateNextPrevButtons()
        
        //Update labels
        updateLabels()
        
        saveAllFlaashcardsToDisk()
    }
    
    func updateNextPrevButtons(){
        
        //Disable next button if at the end
        if currentIndex==flashcards.count-1 {
            nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        
        else{
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels(){
        
        //Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        //Update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        
    }
  
    func saveAllFlaashcardsToDisk(){
    
        let dictionaryArray = flashcards.map { (card) -> [String: String] in return ["question": card.question, "answer": card.answer]
        }
        //Save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        
        print("Flashcards saved to UserDefaults :D")
    }
    
    func readSavedFlashcards(){
        //Read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            
            let savedCards = dictionaryArray.map {dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
                
            }
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
    
}

//
//  ViewController.swift
//  Flashcard App
//
//  Created by Keren Razo on 2/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didtTapOnFlashcard(_ sender: Any) {
        frontLabel.isHidden=true;
    }
}

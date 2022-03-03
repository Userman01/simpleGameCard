//
//  ViewController.swift
//  AppTestStanford_01
//
//  Created by Петр Постников on 03.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var touches = 0{
        didSet{
            TochLabel.text = "TouchCount: \(touches)"
        }
    }
    let collectionEmogi = ["☹️", "😖", "🤥", "😶‍🌫️"]
    
    @IBOutlet weak var TochLabel: UILabel!
    @IBOutlet var TouchBarCollection: [UIButton]!
 
    @IBAction func CartView(_ sender: Any) {
        touches += 1
        if let indexButton = TouchBarCollection.firstIndex(of: sender as! UIButton) {
            flip(emogi: collectionEmogi[indexButton], button: sender as! UIButton)
        }
       
    }
    
    
    func flip(emogi: String, button: UIButton){
        if button.currentTitle == emogi {
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.gray
        } else{
            button.setTitle(emogi, for: .normal)
            button.backgroundColor = UIColor.white
        }
    }
    
}

//
//  ViewController.swift
//  AppTestStanford_01
//
//  Created by Петр Постников on 03.03.2022.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = ConcentrationGame(numberCarcouple: (TouchBarCollection.count)/2)
    
   
    
    @IBOutlet var TouchBarCollection: [UIButton]!
 
    @IBAction func CartView(_ sender: Any) {
        if let indexButton = TouchBarCollection.firstIndex(of: sender as! UIButton) {
            game.chooseCard(at: indexButton)
            updateViewFromModel()
        }
       
    }
    @IBAction func Update(_ sender: Any) {
            game.updateView()
        updateViewFromModel()
    }
    func updateViewFromModel(){
        for index in TouchBarCollection.indices{
            let button = TouchBarCollection[index]
            let card = game.cards[index]
            if card.isFaseUp {
                    button.setTitle(emogiIdentifier(of: card), for: .normal)
                    button.backgroundColor = UIColor.white
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = UIColor.gray
            }
        }
    }
    var collectionEmogi = ["☹️", "😖", "🤥", "😶‍🌫️","😵‍💫", "🤡", "👺", "👻","😻","🎃"]
    
    var emogiDictionary = [Int:String]()
    func emogiIdentifier(of card: Card) -> String{
        if emogiDictionary[card.identifier] == nil{
            let randomIndex = arc4random_uniform(UInt32(collectionEmogi.count))
            emogiDictionary[card.identifier] = collectionEmogi.remove(at: Int(randomIndex))
        }
        return emogiDictionary[card.identifier] ?? "?"
    }
    
    
}

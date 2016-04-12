//
//  ViewController.swift
//  PokerDeck
//
//  Created by Pierre Facq on 01/04/2016.
//  Copyright © 2016 Pierre Facq, Clément Puissant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck: Deck!
    var hand: Hand? = nil
    
    @IBOutlet weak var buttonDrawOne: UIButton!
    @IBOutlet weak var buttonDrawFive: UIButton!
    @IBOutlet weak var buttonReload: UIButton!
    @IBOutlet weak var buttonEvaluate: UIButton!
    
    @IBOutlet weak var textCard1: UILabel!
    @IBOutlet weak var textCard2: UILabel!
    @IBOutlet weak var textCard3: UILabel!
    @IBOutlet weak var textCard4: UILabel!
    @IBOutlet weak var textCard5: UILabel!
    
    @IBOutlet weak var textStack: UILabel!
    @IBOutlet weak var textEvaluate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        deck = Deck()
        hand = Hand()
        deck.createDeck()
        deck.shuffleDeck()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func drawOne(sender: AnyObject) {
        deck.drawOne(&hand!)
        updateTexts()
        if(hand!.cards.count > 4)
        {
            disableButton(buttonDrawOne)
            disableButton(buttonDrawFive)
        }
    }
    
    @IBAction func drawAll(sender: UIButton) {
        deck.drawAll(&hand!)
        updateTexts()
        disableButton(buttonDrawOne)
        disableButton(buttonDrawFive)
    }
    
    @IBAction func evaluateHand(sender: AnyObject) {
        textEvaluate.text = hand!.combinaison()
    }
    
    @IBAction func reloadShuffle(sender: UIButton) {
        if(deck.cards.count == 52)
        {
            deck.shuffleDeck()
        }
        else
        {
            deck.empty()
            hand!.empty()
            deck.createDeck()
            deck.shuffleDeck()
        }
        updateTexts()
        enableButton(buttonDrawOne)
        enableButton(buttonDrawFive)
    }
    
    
    func disableButton(button : UIButton) {
        button.enabled = false
        button.alpha = 0.3
    }
    
    func enableButton(button: UIButton) {
        button.enabled = true
        button.alpha = 1
    }
    
    
    func updateTexts() {
        if(hand!.cards.count > 0)
        {
            textCard1.text = "\(hand!.cards[0].rank.rawValue) " + " \(hand!.cards[0].suit.rawValue)"
        }
        else
        {
            textCard1.text = "Carte 1"
        }
        
        if(hand!.cards.count > 1)
        {
            textCard2.text = "\(hand!.cards[1].rank.rawValue) " + " \(hand!.cards[1].suit.rawValue)"
        }
        else
        {
            textCard2.text = "Carte 2"
        }
        
        if(hand!.cards.count > 2)
        {
            textCard3.text = "\(hand!.cards[2].rank.rawValue) " + " \(hand!.cards[2].suit.rawValue)"
        }
        else
        {
            textCard3.text = "Carte 3"
        }
        
        if(hand!.cards.count > 3)
        {
            textCard4.text = "\(hand!.cards[3].rank.rawValue) " + " \(hand!.cards[3].suit.rawValue)"
        }
        else
        {
            textCard4.text = "Carte 4"
        }
        
        if(hand!.cards.count > 4)
        {
            textCard5.text = "\(hand!.cards[4].rank.rawValue) " + " \(hand!.cards[4].suit.rawValue)"
        }
        else
        {
            textCard5.text = "Carte 5"
        }
        
        textStack.text = "Pile : " + String(deck.cards.count) + " cartes mélangées"
        textEvaluate.text = "Evaluation : N/A"
    }
    

}


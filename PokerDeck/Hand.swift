//
//  Hand.swift
//  PokerDeck
//
//  Created by Pierre Facq on 03/04/2016.
//  Copyright © 2016 Pierre Facq, Clément Puissant. All rights reserved.
//

import Foundation

public struct Hand {
    public var cards: [Card]
    
    init() {
        cards = [Card]()
    }
    
    mutating func empty() {
        cards.removeAll()
    }
    
    func combinaison() -> String{
        var ranktable = [Int]()
        var suittable = [Int]()
        var ranknbtable = [Int](count: 13, repeatedValue: 0)
        var suitnbtable = [Int](count: 4, repeatedValue: 0)
        var rank : Int
        var suit : Int
        var maxsuit : Int = 0
        var imaxsuit : Int = 0
        var firstmax : Int = 0
        var secondmax : Int = 0
        var ifirstmax : Int = 0
        var isecondmax : Int = 0
        var optioncase : Int = 0
        var suitecompteur : Int = 0
        var suiteresult = [String]()
        var quinteroyal = false
        
        for eachcard in cards{
            rank = Rank.allRank.indexOf(eachcard.rank)!
            suit = Suit.allSuit.indexOf(eachcard.suit)!
            ranktable.append(rank)
            suittable.append(suit)
            ranknbtable[rank] += 1
            suitnbtable[suit] += 1
        }
        
        //Parcours de max vers min retourne 2 plus hautes valeurs
        for (index,eachrank) in ranknbtable.reverse().enumerate(){
            if (eachrank > firstmax){
                isecondmax = ifirstmax
                secondmax = firstmax
                ifirstmax = 12-index
                firstmax = eachrank
            }
            else if (eachrank > secondmax && eachrank <= firstmax ){
                isecondmax = 12-index
                secondmax = eachrank
            }
        }
        
        // Retourne indice de la plus nombreuse couleur et assigne couleur si
        for (index,eachsuit) in suitnbtable.enumerate() {
            imaxsuit = (eachsuit > maxsuit ? index : imaxsuit)
            maxsuit = (eachsuit > maxsuit ? eachsuit : maxsuit)
        }
        
        // Retourne suite
        for(index,eachrank) in ranknbtable.enumerate() {
            if(eachrank == 1){ suitecompteur += 1; suiteresult.append(Rank.allRank[index].rawValue)}
            else {suitecompteur = 0}
            if(suitecompteur == 5) { optioncase = 5; break}
            else if (suitecompteur == 4 && ranknbtable[0] == 1){
                optioncase = 5
                quinteroyal = true
                suiteresult.append(suiteresult[0])
                suiteresult.removeAtIndex(0)
                break
            } // special pour suite bouclée sur As
        }
        
        if (maxsuit == 5 && optioncase == 5 && quinteroyal) {optioncase = 10}
        else if (maxsuit == 5 && optioncase == 5) {optioncase = 9}
        else if (firstmax == 4) {optioncase = 8}
        else if (firstmax == 3 && secondmax == 2) {optioncase = 7}
        else if (firstmax == 2 && secondmax == 2) {optioncase = 4}
        else if (maxsuit == 5 && optioncase < 5) {optioncase = 6}
        else if (optioncase < 4) {optioncase = firstmax}
        else if (optioncase == 1 && ranknbtable[0] == 1) {ifirstmax = 0}
        
        switch (optioncase){
        case 10 :
            return("Quinte Flush Royale \(suiteresult) à \(Suit.allSuit[imaxsuit].rawValue)")
        case 9 :
            return("Quinte Flush \(suiteresult) à \(Suit.allSuit[imaxsuit].rawValue)")
        case 8 :
            return("Carré de \(Rank.allRank[ifirstmax])")
        case 7:
            return("Full avec Brelan de \(Rank.allRank[ifirstmax]) et paire de \(Rank.allRank[isecondmax])")
        case 6 :
            return("Couleur à \(Suit.allSuit[imaxsuit].rawValue)")
        case 5 :
            return("Suite \(suiteresult)")
        case 4 :
            return("Double paire de \(Rank.allRank[ifirstmax]) et \(Rank.allRank[isecondmax])")
        case 3 :
            return("Brelan de \(Rank.allRank[ifirstmax])")
        case 2 : 
            return("Paire de \(Rank.allRank[ifirstmax])")
        case 1 : 
            return("Hauteur \(Rank.allRank[ifirstmax])")
        default :
                return "Pas de combinaison"
            break
        }
        
    }
}


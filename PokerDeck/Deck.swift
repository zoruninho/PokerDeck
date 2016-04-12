//
//  Deck.swift
//  PokerDeck
//
//  Created by Pierre Facq on 03/04/2016.
//  Copyright © 2016 Pierre Facq, Clément Puissant. All rights reserved.
//

import Foundation

public struct Deck {
    public var cards: [Card]
    
    init() {
        cards = [Card]()
    }
    
    mutating func createDeck() {
        for suit in Suit.allSuit {
            for rank in Rank.allRank {
                let newCard = Card(suit: suit, rank: rank)
                cards.append(newCard)
            }
        }
    }
    
    // Parcours et affiche le Deck
    func printDeck(){
        var deckcards = ""
        for card in cards {
            deckcards += "\(card.rank.rawValue) \(card.suit.rawValue) | "
            //print("\(cards.rank.rawValue) \(cards.suit.rawValue)")
        }
        print("\n" + deckcards)
    }
    
    mutating func empty() {
        cards.removeAll()
    }
    
    // Mélange le paquet de cartes
    mutating func shuffleDeck() {
        var n = 0
        var randomCardNumber: Int
        var temp: Card
        while n <= 51 {
            randomCardNumber = Int(rand()%(52))
            temp = cards[n]
            cards[n] = cards[randomCardNumber]
            cards[randomCardNumber] = temp
            n+=1
        }
    }
    
    //Tirer une carte, la dernière
    mutating func drawOne(inout hand: Hand) {
        if(hand.cards.count < 5)
        {
            hand.cards.append(cards.last!)
            print("\n  Tirage : \(cards.last!.rank.rawValue)"
                + " \(cards.last!.suit.rawValue)")
            cards.removeLast()
        }
    }
    
    //Tirer pour remplir la main
    mutating func drawAll(inout hand: Hand){
        let drawRemaining = 5 - hand.cards.count
        if drawRemaining > 0 {
            for _ in 1...drawRemaining {
                drawOne(&hand)
            }
        }
    }
    
}


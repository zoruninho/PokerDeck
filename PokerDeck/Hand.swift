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
}


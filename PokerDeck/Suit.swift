//
//  Suit.swift
//  PokerDeck
//
//  Created by Pierre Facq on 03/04/2016.
//  Copyright © 2016 Pierre Facq, Clément Puissant. All rights reserved.
//

import Foundation

public enum Suit: String {
    case Trefle = "\u{2663}"
    case Carreau = "\u{2666}"
    case Coeur = "\u{2665}"
    case Pique = "\u{2660}"
    case __EXHAUST = ""
    
    static let allSuit = [Trefle, Carreau, Coeur, Pique]
}
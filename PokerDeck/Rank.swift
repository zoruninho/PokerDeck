//
//  Rank.swift
//  PokerDeck
//
//  Created by Pierre Facq on 03/04/2016.
//  Copyright © 2016 Pierre Facq, Clément Puissant. All rights reserved.
//

import Foundation

public enum Rank: String {
    case As = "As"
    case Deux = "Deux"
    case Trois = "Trois"
    case Quatre = "Quatre"
    case Cinq = "Cinq"
    case Six = "Six"
    case Sept = "Sept"
    case Huit = "Huit"
    case Neuf = "Neuf"
    case Dix = "Dix"
    case Valet = "Valet"
    case Reine = "Reine"
    case Roi = "Roi"
    case __EXHAUST = ""
    
    static let allRank = [As, Deux, Trois, Quatre, Cinq, Six, Sept,
                          Huit, Neuf, Dix, Valet, Reine, Roi]
}
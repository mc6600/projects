//
//  Card.swift
//  Concentration
//
//  Created by Ming Chen on 8/7/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false;
    var isMatched = false;
    var id: Int
    
    private static var idFactory = 0
    
    private static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init() {
        self.id = Card.getUniqueId()
    }
    
}

//
//  Concentration.swift
//  Concentration
//
//  Created by Ming Chen on 8/7/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import Foundation

struct Concentration
{
    // var cards = Array<Card>()    //
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = ( index == newValue )
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        // first to assert things are ok
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards" )
        
        // ignore a card is matched
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if two cards match
                if cards[matchIndex].id == cards[index].id {
                    // matched
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                // indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no card, or 2 cards are face up
                /*for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp  = false
                }
                cards[index].isFaceUp = true */
 
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
        /*
        if( cards[index].isFaceUp ){
            cards[index].isFaceUp = false
        }else {
            cards[index].isFaceUp = true
        }*/
    }
    
    // Swift sequence: array, string ...
    // Array is a struct
    
    init(numberOfPairsOfCard: Int) {
        assert(numberOfPairsOfCard > 0, "Concentration init(\(String(describing: index))): you must have at least one pair of cards")
        
        for _ in 1...numberOfPairsOfCard {
            // let card = Card(id: id)
            // cards.append(card)
            // cards.append(card)
            
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
        cards.shuffle()
    }
}

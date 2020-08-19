//
//  ViewController.swift
//  Concentration
//
//  Created by Ming Chen on 8/6/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    private lazy var game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2 )
    
    private(set) var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func NewGame(_ sender: UIButton) {
        print("new game")
        // reset flip counter
        flipCount = 0
        // Reset all buttons face down and new emoji
        game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2 )
        emojiChoices = ["👻", "🎃", "🥶", "👽", "🍎", "😈" ,"😓","👍" ]
        //viewWillAppear(true)
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            //print( "Card number = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("No card number presented")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: .normal )
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    private var emojiChoices = ["👻", "🎃", "🥶", "👽", "🍎", "😈" ,"😓","👍" ]
    
    // like a hashMap
    private var emoji =  Dictionary<Int, String>()

    private func emoji(for card: Card) -> String {

        /*
        if emoji[card.id] == nil {
            if( emojiChoices.count > 0 ){
                let randonIdx = arc4random_uniform(UInt32(emojiChoices.count))
                emoji[card.id] = emojiChoices.remove(at: Int(randonIdx))
            }
        }
         first to check if it's not nil...
        if emoji[card.id] != nil {
            return emoji[card.id]!
        } else{
             return "?"
        } */
        
        if emoji[card.id] == nil, emojiChoices.count > 0 {
            // let randonIdx = arc4random_uniform(UInt32(emojiChoices.count))
            // emoji[card.id] = emojiChoices.remove(at: Int(randonIdx))
            emoji[card.id] = emojiChoices.remove(at: emojiChoices.count.arc4Random )
        }
        // or do this:
        return emoji[card.id] ?? "?"
    }
    
    
    private func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        } else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}


// here is the lecture about extension
extension Int {
    var arc4Random: Int {
        if( self > 0 ) {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

//
//  InspCheckItem.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 7/17/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import Foundation

struct InspCheckItem {
    var id: String
    var comment: String
    var ans: CheckAnswer
    var question: String    // Inspection component drop down menu
    
    init( id: String,
        comment: String,
        ans: CheckAnswer,
        question: String
    ) {
        
        self.id = id
        self.comment = comment
        self.ans = ans
        self.question = question
    }
}

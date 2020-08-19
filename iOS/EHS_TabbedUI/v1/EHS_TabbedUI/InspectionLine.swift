//
//  InspectionLine.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 5/11/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import Foundation

struct InspectionLine {
    
    var date: Date
    var focus: String
    var category: String
    var contentQuestion: String
    var isYes: Bool
    var comment: String
    
    /*
    enum Category {
        case ee: "Electrical Equipment"
        case fp: "Fore Protection"
    }*/
    
    init( category: String,
        comment: String,
        focus: String,
        content: String,
        isYes: Bool
    ) {
        self.date = Date()
        self.isYes = isYes
        self.focus = focus
        self.comment = comment
        self.category = category
        self.contentQuestion = content
    }
}

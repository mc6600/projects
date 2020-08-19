//
//  InspCheckItem.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 6/4/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//


import Foundation

class InspCheckAnswer: ObservableObject {
    
    @Published var comment: String = ""
    @Published var ans: CheckAnswer = CheckAnswer.NA
    
}


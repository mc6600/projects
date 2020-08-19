//
//  CheckItem.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 7/23/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import Foundation

class CheckItem {
    
    var id: String
    var content: String
    var order: Int
    
    init( id: String,
        content: String,
        order: Int
    ) {
        self.id = id
        self.content = content
        self.order = order
    }
}

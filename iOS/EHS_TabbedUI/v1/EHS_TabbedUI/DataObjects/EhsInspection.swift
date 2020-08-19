//
//  EhsInspection.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 3/16/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import Foundation

class EhsInspection {
    
    var type: String
    var location: String
    var area: String
    var building: String
    var date: NSDate
    
    init( type: String,
        location: String,
        area: String,
        building: String
    ) {
        self.type = type
        self.location = location
        self.area = area
        self.building = building
        let today = NSDate()
        self.date = today
    }
}

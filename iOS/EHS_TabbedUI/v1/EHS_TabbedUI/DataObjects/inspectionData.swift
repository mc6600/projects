//
//  inspectionData.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 6/4/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import Foundation

struct InspectionData {
    var id: String
    var type: InspectType
    var location: String
    var bldg: String
    var area: String
    var inspector: String
    var auditDate: Date
    var submitDate: Date
    
    //var checkList = Array<InspCheckItem>()
    

    init( id: String,
        type: InspectType,
        location: String,
        bldg: String,
        area: String,
        inspector: String
    ) {
        self.id = id
        self.type = type
        self.location = location
        self.inspector = inspector
        self.bldg =  bldg
        self.area = area
        self.submitDate = Date()
        self.auditDate =  Date()
    }
    

}

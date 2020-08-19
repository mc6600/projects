//
//  FBUser2.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 3/24/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import Foundation

class FBUser2: Codable {
    
    var name: String
    var loginId: String
    var privilege: String
    
    
    convenience init(){
        self.init(name:"", loginId:"", privilege:"" )
    }
    
    init( name: String,
        loginId: String,
        privilege: String
    ) {
        self.name = name
        self.loginId = loginId
        self.privilege = privilege
    }
}

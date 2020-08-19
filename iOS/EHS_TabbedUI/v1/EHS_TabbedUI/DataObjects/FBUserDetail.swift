//
//  FBUserDetail.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 4/27/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import Foundation


class FBUserDetail: Codable {
    
    var name: String
    var login: String
    var priv: String
    var title: String
    var location: String
    var mgr: String
    
    convenience init(){
        self.init(name:"", login:"", priv:"", title:"", loc:"", mgr: "" )
    }
    
    init( name: String,
        login: String,
        priv: String,
        title: String,
        loc: String,
        mgr: String
    ) {
        self.name = name
        self.login = login
        self.priv = priv
        self.title =  title
        self.location = loc
        self.mgr = mgr
    }
}

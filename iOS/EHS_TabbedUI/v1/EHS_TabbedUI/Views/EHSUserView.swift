//
//  EHSUserView.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 4/13/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI

struct EHSUserView: View {
  let urlPath  = "https://ehsmetrics.thefacebook.com/RestController.php?api=getEhsUsers"
  let sessionDelegate = SessionDelegate()
      
  @State private var name: String = "John"
  @State private var toggleStatus = false
  @State private var users: Array<FBUser2> = []
  @State private var count = 0
      
    
    var loginName = "Ming Chen"
    //@State private var showDetails = false
    
    var body: some View {
        VStack{
            Text("EHS Mobile App")
                .font(.title)
            
            Text("Welcome, " + loginName )
                .font(.subheadline)
            
            Image("EHSTeam")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 10)
        }
    }
}

struct EHDUserView_Previews: PreviewProvider {
    static var previews: some View {
        EHSUserView()
    }
}

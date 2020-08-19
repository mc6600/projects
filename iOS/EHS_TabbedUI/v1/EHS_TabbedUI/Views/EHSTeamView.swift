//
//  EHDTeam.swift
//  EHS Mobile
//
//  Created by Ming Chen on 2/11/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI

struct EHSTeamView: View {
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

struct EHDTeamView_Previews: PreviewProvider {
    static var previews: some View {
        EHSTeamView()
    }
}

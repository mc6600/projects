//
//  ContentView1.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 6/10/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI

struct ContentView1: View {
    var body: some View {
        HStack {
            Text("Gender")
                .font(Font.headline)
            RadioButtonGroups { selected in
                print("Selected Gender is: \(selected)")
            }
        }.padding()
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

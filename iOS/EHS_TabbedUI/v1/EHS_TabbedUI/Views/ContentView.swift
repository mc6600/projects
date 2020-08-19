//
//  ContentView.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 2/20/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        
        TabView(selection: $selection ){
            /*
            EHSTeamView().tabItem({
                Image(systemName: "camera.fill")
                .font(.largeTitle)
                Text("EHS Team")
            }).tag(0)
            */
            
            CheckItemView().tabItem({
                Image(systemName: "camera.fill")
                .font(.largeTitle)
                Text("Item Management")
            }).tag(0)
            
            InspectDetailView().tabItem({
                Image(systemName: "arrow.down.left.video")
                .font(.largeTitle)
                Text("Inspection")
            }).tag(1)
            
            InspectionView().tabItem({
                Image(systemName: "car.fill")
                .font(.largeTitle)
                Text("Add Inspection")
            }).tag(2)
            
            SearchView().tabItem({
                Image(systemName: "person.2.fill")
                .font(.largeTitle)
                Text("Search")
            }).tag(3)
            
            UserDetailView().tabItem({
                Image(systemName: "person.3.fill")
                .font(.largeTitle)
                Text("User Management")
            }).tag(4)
            
            
            TestUIView().tabItem({
                Image(systemName: "arrow.down.left.video")
                .font(.largeTitle)
                Text("Test UI")
            }).tag(5)
        }
    }


    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

}

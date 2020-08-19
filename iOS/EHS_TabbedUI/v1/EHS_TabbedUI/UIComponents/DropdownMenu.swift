//
//  DropdownMenu.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 6/10/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI
import Foundation

struct DropdownMenu: View {
    @State private var value = ""
    @State private var expand = false
    
    var body: some View {

        VStack() {
               VStack( spacing: 30){
                   HStack() {
                       Text( "Set user value: " + self.value)
                       Image(systemName: expand ? "chevron.up" : "chevron.down" ).resizable().frame(width:13, height: 6)
                   }
               }.onTapGesture {
                   self.value=""
                   self.expand.toggle()
               }
               
               if expand {
                   
                   Button( action: {
                       self.value = "YES"
                       print("YES clicked")
                       self.expand.toggle()
                   }) {
                       Text("YES")
                           .padding(10)
                   }
                   .buttonStyle(BorderlessButtonStyle())
                   
                   Button( action: {
                       self.value = "NO"
                       print("NO clicked")
                       self.expand.toggle()
                    }) {
                       Text("NO")
                           .padding(10)
                    }
                   .buttonStyle(BorderlessButtonStyle())
                   
                   Button( action: {
                       self.value = "NA"
                       print("NA clicked")
                       self.expand.toggle()
                   }) {
                       //self.priv = "EHS Only"
                       Text("N/A")
                           .padding(10)
                   }
                   .buttonStyle(BorderlessButtonStyle())
                   
               }   // if expand
        }
               
    }   // view
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu()
    }
}

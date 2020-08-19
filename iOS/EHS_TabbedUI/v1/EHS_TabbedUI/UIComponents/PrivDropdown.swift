//
//  PrivDropdown.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 6/10/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI
// import Foundation

struct PrivDropdown: View {
    @State var expand: Bool = false
    @Binding var priv: UserLevel
    
    var body: some View {
        VStack() {
            VStack( spacing: 30){
                HStack() {
                    Text( "Set User Privelege: " + self.priv.priv)
                    Image(systemName: expand ? "chevron.up" : "chevron.down" ).resizable().frame(width:13, height: 6)
                }
            }.onTapGesture {
                self.expand.toggle()
            }
            
            if expand {
                //self.$binding = "expand"
                
                Button( action: {
                    self.priv.priv = "Super User"
                    print("super user clicked")
                    self.expand.toggle()
                }) {
                    Text("Super User")
                        .padding(10)
                }
                .buttonStyle(BorderlessButtonStyle())
                
                Button( action: {
                    self.priv.priv = "Region Admin"
                    print("Region Admin clicked")
                    self.expand.toggle()
                }) {
                    Text("Region Admin")
                        .padding(10)
                }
                .buttonStyle(BorderlessButtonStyle())
                
                Button( action: {
                    self.priv.priv = "EHS Only"
                    print("EHS only clicked")
                    self.expand.toggle()
                }) {
                    Text("EHS Only")
                        .padding(10)
                }
                .buttonStyle(BorderlessButtonStyle())
                
                Button( action: {
                    self.priv.priv = "None"
                    print("None clicked")
                    self.expand.toggle()
                }) {
                    Text("None")
                        .padding(10)
                }
                .buttonStyle(BorderlessButtonStyle())
                
            }   // if expand
        }
        .padding()
    }   
}

/*
struct PrivDropdown_Previews: PreviewProvider {
    static var previews: some View {
        PrivDropdown()
    }
}
*/

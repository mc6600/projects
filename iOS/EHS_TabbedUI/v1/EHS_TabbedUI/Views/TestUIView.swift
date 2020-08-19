//
//  TestUIView.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 6/10/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI
import Foundation


struct TestUIView: View {
    @State private var priv = ""
    @State private var answer = ""
    @State private var dropdown = ""
    @State private var theDate = Date()
    
    //@State var checkItem: ChecklistItem = ChecklistItem.init( item: InspCheckItem.init(id: "01", question: "First q", selectedIndex: 1)
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Testing UI components:")
                .font(.largeTitle)
                
            
            List{
                HStack{
                    Text("User Prvilege:" + self.priv )
                                        
                    // PrivDropdown()
                    //    .font(.headline)
                }
                
                Spacer()

                
                HStack {
                    Text("Checklist Answer:")
                        .font(Font.headline)
                        .padding()
                    RadioButtonGroup1(items: ["YES", "NO", "N/A"], selectedId: "YES") { selected in
                        print("Selected is: \(selected)")
                    }
                }.padding()
                
                Spacer()
                
                HStack{
                    Text("Dropdown answer:" + self.dropdown )
                                        
                    DropdownMenu()
                        .font(.headline)
                }
                
                //Spacer()
                
                HStack(alignment: .center) {
                    DatePicker(selection: $theDate, in: ...Date(), displayedComponents: .date) {
                        Text("Audit Date")
                            .font(.headline)
                    }

                    Text("Date is \(theDate, formatter: dateFormatter)")
                }
                
                
                //Spacer()
       	         
                //let item:InspCheckItem = InspCheckItem.init(id: "01", comment: "Need to replace the garbage bag", ans: CheckAnswer.NO, question: "Are chemical storage areas free of debris/garbage?")
                Text("Checklist Items:" )
                    .font(.headline)
                
                
                // ChecklistItem( question:"Are chemical storage areas free of debris/garbage?",  id:"01" )
                //    .font(.headline)
                // ChecklistItem( question:"Are employees using PPE where required (safety glasses, gloves)?", id:"02")
                //    .font(.headline)
            }
            
        }

        
    }
}

struct TestUIView_Previews: PreviewProvider {
    static var previews: some View {
        TestUIView()
    }
}

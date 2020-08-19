//
//  ChecklistItem.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 6/10/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI

struct ChecklistItem: View {

    //@Binding var answer: InspCheckAnswer
    
    @State var question: String
    @State var id: String
    
    /*
    @State var comment: String = ""
    */
    @State var selectedIndex = 0
    
    static let answers = [ "N/A", "YES", "NO" ]
        
    //var item = InspCheckItem.init(id: "01", comment: "", ans: CheckAnswer.NA, question: "Are chemical storage areas free of debris/garbage?")
    //var  comment:String = ""
    
    var body: some View {
            HStack{
                
                Text( self.id)
                Text( self.question )
                    .frame(width:320, height:50, alignment: .topLeading)
                    .lineLimit(3)
                
                Picker( "", selection: $selectedIndex ) {
                    ForEach(Self.answers, id: \.self ){
                        Text( $0 )
                        .tag( $0 )
                            .foregroundColor( .primary )
                    }
                }
                .frame(width:80, height: 150 )
                
                //TextField("Enter comment", text:"$answer.comment")
                  //  .lineLimit(3)
                    //.frame(width: 300, height: 50, alignment: .topLeading)
                    //.font(.headline)
                    //.keyboardType()
                
            }
    }
}

/*
struct ChecklistItem_Previews: PreviewProvider {
    static var previews: some View {
        var item:InspCheckItem = InspCheckItem.init(id: "1",
                                                    comment: "Need to replace the garbage bag",
                                                    ans: <#T##CheckAnswer#>.YES,
                                                    question: "Are chemical storage areas free of debris/garbage?")
        ChecklistItem(item)
    }
}
*/

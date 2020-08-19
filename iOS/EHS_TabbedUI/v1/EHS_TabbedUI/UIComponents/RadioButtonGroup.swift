//
//  RadioButtonGroup.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 6/10/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI

//MARK:- Group of Radio Buttons

enum Answer: String {
    case yes = "YES"
    case no = "NO"
    case na = "N/A"
}

struct RadioButtonGroup: View {
    //let callback : ((String) ->Void)
    
    
    @State var selected: String = ""
    
    var body: some View {
        HStack {
            radioYes
            radioNo
            radioNa
        }
    }
    
    var radioYes: some View {
        RadioButtonField(
            id: Answer.yes.rawValue,
            label: Answer.yes.rawValue,
            isMarked: selected == Answer.yes.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioNo: some View {
        RadioButtonField(
            id: Answer.no.rawValue,
            label: Answer.no.rawValue,
            isMarked: selected == Answer.no.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioNa: some View {
        RadioButtonField(
            id: Answer.na.rawValue,
            label: Answer.na.rawValue,
            isMarked: selected == Answer.na.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    func radioGroupCallback(id: String) {
        selected = id
        //callback(id)
    }
}

struct RadioButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonGroup()
    }
}


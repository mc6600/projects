//
//  AddInspectionView.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 3/16/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI

struct AddInspectionView: View {
    var body: some View {
        
        /*
         Type
        Location
        Building
        Inspection Area
        Office / Lab Name
         */
        VStack{
            Text("Please Provide the following information to create a new Inspection:")
            Text("Inspection Name: ")
            Text("Region: ")
            Text("Building: ")
            Text("Result: ")
        }
    }
}

struct AddInspectionView_Previews: PreviewProvider {
    static var previews: some View {
        AddInspectionView()
    }
}

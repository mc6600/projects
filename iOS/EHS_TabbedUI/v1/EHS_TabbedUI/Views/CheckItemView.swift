//
//  SettingsView.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 2/24/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI

struct CheckItemView: View {
    @State var newItemContent: String = ""
    @State var items: [CheckItem] = []
    
    var body: some View {
        
        VStack {
            
            List{
                Text("Building Safety: Checklist Item Management")
                    .font( .title)
                    .colorScheme(.light )
                
                    Spacer()
                
                // Add new item
                HStack{
                    Text("NEW ITEM:")
                    TextField("Item content", text: $newItemContent )
                        
                    //Text( "Echo, \(newItemContent)!" )
                    
                    Button(action: {
                        // call ws to update user
                        print("add new item:  " + self.newItemContent )

                        if( self.newItemContent.count > 5 ){
                            let t = "https://ehsmetrics.thefacebook.com/RestController.php?api=createCheckItem&name=" + self.newItemContent
                            let tt = t.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
                            print("Add new item thru ws: " + tt!)

                            let jsonString = self.checkUrl(urlString: tt!)
                            print( jsonString )
                        }
                    }) {

                        Image(systemName: "camera.fill")
                            .font(.largeTitle)
                        Text("Add")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
                // show all active items
                // Able to delete any of the items
                
            } // List
            
        }   // top VStack
    }   // some View
    
    func checkUrl(urlString: String) -> String {
        if let url = URL(string: urlString) {
            var result: String!
            let sessionDelegate = SessionDelegate()
            let urlSession = URLSession(configuration: .default, delegate: sessionDelegate, delegateQueue: nil)
            
            let semaphore = DispatchSemaphore(value: 0)

            urlSession.dataTask(with: url, completionHandler: {
                (data:Data?, response: URLResponse?, error:Error? ) in
                
                if let e = error {
                    print( "URL Data Error:\n" )
                    print(e)
                    result = "Network error"
                    semaphore.signal()
                    //return
                }else{
                    // get the data if any...
                    if let data = data {
                        let dataString = String(data:data, encoding: String.Encoding.utf8)
                        //print( dataString! )
                        //let temp = String( dataString )
                        //let myTemp = "\(String(describing: dataString))"
                        result = dataString!
                    }
                    
                    // refresh the view with new data
                    self.newItemContent = ""
                    
                }
                
                semaphore.signal()
            }).resume()

            semaphore.wait()

            return result
        }else {
            print("Failed to create URL Session: " + urlString )
        }

        return "No result"
    }

}

struct CheckItemView_Previews: PreviewProvider {
    static var previews: some View {
        CheckItemView()
    }
}

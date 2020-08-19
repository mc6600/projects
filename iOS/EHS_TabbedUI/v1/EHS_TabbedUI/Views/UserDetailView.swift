//
//  UserDetailView.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 2/24/20.
//  Copyright © 2020 Ming Chen. All rights reserved.


import SwiftUI
import Foundation
//import Components

struct UserDetailView: View {
    //@Binding var viewType: String

    @State private var name: String = ""
    @State private var userFound = false
    //@State private var count = 0
    @State private var theUser: FBUserDetail = FBUserDetail.init()
    @State private var priv: UserLevel = UserLevel.init()
    
    var body: some View {
        VStack{
            HStack {
                    Text("Enter user name: ")
                    TextField("Enter fisrt name to search:", text:$name)

                    Button(action:{
                        // call ws api and populate the user detail
                        var t = "https://ehsmetrics.thefacebook.com/RestController.php?api=getDetail&login=" + self.name
                        //print(t)
                        if( self.name == "" ){
                            t = ""
                            self.theUser = FBUserDetail.init(name: "No User Found", login: "No User Found", priv: "N/A", title: "N/A", loc: "N/A", mgr: "N/A" )
                            self.userFound =  false
                        }

                        let jsonString = self.checkUrl(urlString: t)
                        print( jsonString.count )
                        if ( jsonString.count > 20 ){
                            // marshall the json data into user detail
                            self.parseJson(jsonString: jsonString)
                            self.userFound =  true
                        }else{
                            self.userFound =  false
                        }
                    })
                    {
                        Text("Click to search users...")
                    }
            } // HStack
            
            List{
                if( userFound == true ){
                    HStack{
                        Text( "Name: " + self.theUser.name)
                            .font(.title)
                       
                        Spacer()
                        Image(self.theUser.login)
                        .fixedSize()
                                  .clipShape(Circle())
                                  .overlay(
                                      Circle().stroke(Color.gray, lineWidth: 1))
                                  .shadow(radius: 1)
                    }
                    
                    Text( "User Level: " + self.theUser.priv)
                        .font(.headline)
                    
                    PrivDropdown( priv: $priv)
                        .font(.headline)

                    HStack{
                        Text( "Job Title: " )
                        Text( self.theUser.title )
                        Text( ";          ")
                        Text( "Manager: " )
                        Text( self.theUser.mgr )
                    }
                    .font(.headline)
                    
                    HStack{
                        Text( "Login id: " )
                        Text(self.theUser.login )
                        Text( ";          ")
                        Text( "Location: " )
                        Text(self.theUser.location)
                    }
                    .font(.headline)
                    
                    Spacer()
                    
                    // update button:
                    Button( action: {
                        // call ws to update user
                        print("update user:  " + self.priv.priv )
                        let t = "https://ehsmetrics.thefacebook.com/RestController.php?api=updateDetail&login=" + self.theUser.login + "&priv=" + self.priv.priv
                        let tt = t.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
                        print("Updating user profile: " + tt!)

                        let jsonString = self.checkUrl(urlString: tt!)
                        print( jsonString )
                        
                        
                    }) {
                        //self.priv = "EHS Only"
                        Text("Update User Profile")
                            .padding(.all, 12)
                            .background(Color.gray)
                            
                    }
                    .font(.headline)
                    .cornerRadius(40)
                    
                    
                }   // if user found
                else{
                    Text("User NOT found")
                        // set color
                }
                
            }   // List

        } // VStack
    }   // View
    
    
    // parse json into my dear user detail :)
    func parseJson(jsonString:String) {

        print(jsonString)
        let jsonData   = jsonString.data(using: .utf8)!
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options : .fragmentsAllowed) as? [Dictionary<String,String>]
            {
                //print(jsonArray) // use the json here
                for user in jsonArray{
                    print(user)
                    var name:String=""
                    var priv: String=""
                    var login: String=""
                    var mgr:String=""
                    var loc: String=""
                    var title: String=""
                    
                    for( kind,value) in user{
                        if( kind == "name" ){
                            name = value
                        }else if( kind == "login"){
                            login = value
                        }else if( kind == "priv"){
                            priv = value
                        }else if( kind == "title"){
                            title = value
                        }else if( kind == "location"){
                            loc = value
                        }else if( kind == "manager"){
                            mgr = value
                        }
                    }   // for
                    let ud: FBUserDetail = FBUserDetail.init(name: name, login: login, priv: priv, title: title, loc: loc, mgr: mgr)
                    self.theUser = ud
                }
            }
        }catch let error as NSError {
            print(error)
        }
    }//func
    
    
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


struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {

        UserDetailView()
    }
}


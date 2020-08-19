//
//  SearchView.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 2/24/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    let urlPath  = "https://ehsmetrics.thefacebook.com/RestController.php?api=getEhsUsers"
    let sessionDelegate = SessionDelegate()
        
    @State private var name: String = "John"
    @State private var toggleStatus = false
    @State private var users: Array<FBUser2> = []
    
    
    @State private var count = 0
    
    var body: some View {
        VStack{
            
            HStack(alignment: .center){
                Text("Enter First name to search: ")
                TextField("Enter fisrt name to search:", text:$name)

                Button(action:{
                    self.users.removeAll()
                    
                    // searching the records thru calling out to web services
                    var t = "https://ehsmetrics.thefacebook.com/RestController.php?api=searchUsers&name=" + self.name
                    
                    if( self.name == "" ){
                        t = ""
                        self.AddNoUser(name: "No Firstname specified")
                    }
                    
                    let jsonString = self.checkUrl(urlString: t)
                    
                    if( jsonString == "Network error" ){
                        self.AddNoUser(name: "Network Error")
                    }else{
  
                        let jsonData   = jsonString.data(using: .utf8)!
                        do {
                            if let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options : .fragmentsAllowed) as? [Dictionary<String,String>]
                            {
                                //print(jsonArray) // use the json here
                                
                                for user in jsonArray{
                                    print( user )
                                    var name:String=""
                                    var privilege: String=""
                                    var login: String=""
                                    
                                    for( kind, value ) in user{
                                        //print(kind + value)
                                        if( kind == "name" ){
                                            name = value
                                        }else if( kind == "login"){
                                            login = value
                                        }else if( kind == "privilege"){
                                            privilege = value
                                        }
                                    } // for

                                    let u: FBUser2 = FBUser2.init(name: name, loginId: login, privilege: privilege )
                                    self.users.append(u)
                                }
                                
                                self.count = self.users.count

                            } else {
                                print("bad json")
                            }
                        } catch let error as NSError {
                            print(error)
                        }
                    }
                })
                {
                    Text("Click to search users...")
                }
            }
            
            List{
                
                Toggle(isOn: $toggleStatus){
                    Text("Show User Details")
                }
                

                if( toggleStatus == true ) {

                    if( self.users.count == 1){
                        HStack{
                            Text( self.users[0].name + ",   " + self.users[0].privilege )
                            Text( ",    " + self.users[0].loginId )
                        }
                    }
                    else if( self.users.count == 2){
                        HStack{
                            Text( self.users[0].name + ",   " + self.users[0].privilege )
                            Text( ",    " + self.users[0].loginId )
                        }
                        HStack{
                            Text( self.users[1].name + ",   " + self.users[1].privilege )
                            Text( ",    " + self.users[1].loginId )
                        }
                    }
                    else if( self.users.count == 3){
                        HStack{
                            Text( self.users[0].name + ",   " + self.users[0].privilege )
                            Text( ",    " + self.users[0].loginId )
                        }
                        HStack{
                            Text( self.users[1].name + ",   " + self.users[1].privilege )
                            Text( ",    " + self.users[1].loginId )
                        }
                        HStack{
                            Text( self.users[2].name + ",   " + self.users[2].privilege )
                            Text( ",    " + self.users[2].loginId )
                        }
                    }
                    else if( self.users.count == 4){
                        Text(self.users[0].name + ",   " + self.users[0].privilege + ",    " + self.users[0].loginId )
                        Text(self.users[1].name + ",   " + self.users[1].privilege + ",    " + self.users[1].loginId )
                        Text(self.users[2].name + ",   " + self.users[2].privilege + ",    " + self.users[2].loginId)
                        Text(self.users[3].name + ",   " + self.users[3].privilege + ",    " + self.users[3].loginId )
                    }
                    else if( self.users.count == 5){
                        Text(self.users[0].name + ",   " + self.users[0].privilege)
                        Text(self.users[1].name + ",   " + self.users[1].privilege)
                        Text(self.users[2].name + ",   " + self.users[2].privilege)
                        Text(self.users[3].name + ",   " + self.users[3].privilege)
                        Text(self.users[4].name + ",   " + self.users[4].privilege)
                    }
                    else if( self.users.count == 6){
                        Text(self.users[0].name + ",   " + self.users[0].privilege)
                        Text(self.users[1].name + ",   " + self.users[1].privilege)
                        Text(self.users[2].name + ",   " + self.users[2].privilege)
                        Text(self.users[3].name + ",   " + self.users[3].privilege)
                        Text(self.users[4].name + ",   " + self.users[4].privilege)
                        Text(self.users[5].name + ",   " + self.users[5].privilege)
                    }
                    
                    else if( self.users.count == 7){
                        Text(self.users[0].name + ",   " + self.users[0].privilege)
                        Text(self.users[1].name + ",   " + self.users[1].privilege)
                        Text(self.users[2].name + ",   " + self.users[2].privilege)
                        Text(self.users[3].name + ",   " + self.users[3].privilege)
                        Text(self.users[4].name + ",   " + self.users[4].privilege)
                        Text(self.users[5].name + ",   " + self.users[5].privilege)
                        Text(self.users[6].name + ",   " + self.users[6].privilege)
                    }
                    else if( self.users.count == 8){
                        Text(self.users[0].name + ",   " + self.users[0].privilege)
                        Text(self.users[1].name + ",   " + self.users[1].privilege)
                        Text(self.users[2].name + ",   " + self.users[2].privilege)
                        Text(self.users[3].name + ",   " + self.users[3].privilege)
                        Text(self.users[4].name + ",   " + self.users[4].privilege)
                        Text(self.users[5].name + ",   " + self.users[5].privilege)
                        Text(self.users[6].name + ",   " + self.users[6].privilege)
                        Text(self.users[7].name + ",   " + self.users[7].privilege)
                    }
                    else if( self.users.count == 9){
                        Text(self.users[0].name + ",   " + self.users[0].privilege)
                        Text(self.users[1].name + ",   " + self.users[1].privilege)
                        Text(self.users[2].name + ",   " + self.users[2].privilege)
                        Text(self.users[3].name + ",   " + self.users[3].privilege)
                        Text(self.users[4].name + ",   " + self.users[4].privilege)
                        Text(self.users[5].name + ",   " + self.users[5].privilege)
                        Text(self.users[6].name + ",   " + self.users[6].privilege)
                        Text(self.users[7].name + ",   " + self.users[7].privilege)
                        Text(self.users[8].name + ",   " + self.users[8].privilege)
                    }
                    else if( self.users.count >= 10){
                        Text(self.users[0].name + ",   " + self.users[0].privilege)
                        Text(self.users[1].name + ",   " + self.users[1].privilege)
                        Text(self.users[2].name + ",   " + self.users[2].privilege)
                        Text(self.users[3].name + ",   " + self.users[3].privilege)
                        Text(self.users[4].name + ",   " + self.users[4].privilege)
                        Text(self.users[5].name + ",   " + self.users[5].privilege)
                        Text(self.users[6].name + ",   " + self.users[6].privilege)
                        Text(self.users[7].name + ",   " + self.users[7].privilege)
                        Text(self.users[8].name + ",   " + self.users[8].privilege)
                        Text(self.users[9].name + ",   " + self.users[9].privilege)
                    }
                }
                else{
                    if( self.users.count == 1){
                        Text(self.users[0].name)
                    }
                    if( self.users.count == 2){
                        Text(self.users[0].name)
                        Text(self.users[1].name)
                    }
                    if( self.users.count == 3){
                        Text(self.users[0].name)
                        Text(self.users[1].name)
                        Text(self.users[2].name)
                    }
                    if( self.users.count == 4){
                        Text(self.users[0].name)
                        Text(self.users[1].name)
                        Text(self.users[2].name)
                        Text(self.users[3].name)
                    }
                    if( self.users.count == 5){
                        Text(self.users[0].name)
                        Text(self.users[1].name)
                        Text(self.users[2].name)
                        Text(self.users[3].name)
                        Text(self.users[4].name)
                    }
                    if( self.users.count == 6){
                        Text(self.users[0].name)
                        Text(self.users[1].name)
                        Text(self.users[2].name)
                        Text(self.users[3].name)
                        Text(self.users[4].name)
                        Text(self.users[5].name)
                    }
                    if( self.users.count == 7){
                        Text(self.users[0].name)
                        Text(self.users[1].name)
                        Text(self.users[2].name)
                        Text(self.users[3].name)
                        Text(self.users[4].name)
                        Text(self.users[5].name)
                        Text(self.users[6].name)
                    }
                    if( self.users.count == 8){
                        Text(self.users[0].name)
                        Text(self.users[1].name)
                        Text(self.users[2].name)
                        Text(self.users[3].name)
                        Text(self.users[4].name)
                        Text(self.users[5].name)
                        Text(self.users[6].name)
                        Text(self.users[7].name)
                    }
                    if( self.users.count == 9){
                        Text(self.users[0].name)
                        Text(self.users[1].name)
                        Text(self.users[2].name)
                        Text(self.users[3].name)
                        Text(self.users[4].name)
                        Text(self.users[5].name)
                        Text(self.users[6].name)
                        Text(self.users[7].name)
                        Text(self.users[8].name)
                    }
                    if( self.users.count >= 10){
                        Text(self.users[0].name)
                        Text(self.users[1].name)
                        Text(self.users[2].name)
                        Text(self.users[3].name)
                        Text(self.users[4].name)
                        Text(self.users[5].name)
                        Text(self.users[6].name)
                        Text(self.users[7].name)
                        Text(self.users[8].name)
                        Text(self.users[9].name)
                    }

                }
            }
        }
    }
    
    
    func AddNoUser(name: String) {
        let u: FBUser2 = FBUser2.init(name: name, loginId: "No User Found", privilege: "N/A" )
        self.users.append(u)
    }
    
    func parseJson(anyObj:AnyObject) -> Array<FBUser2>{

       var list:Array<FBUser2> = []

        if  anyObj is Array<AnyObject> {

            let b:FBUser2 = FBUser2.init()

            for json in anyObj as! Array<AnyObject>{
                b.name = (json["name"] as AnyObject? as? String) ?? "" // to get rid of null
                b.loginId  =  (json["login"]  as AnyObject? as? String) ?? ""
                b.privilege = (json["privilege"] as AnyObject? as? String) ?? ""
                list.append(b)
            }// for

       } // if
        
        return list
    }//func
    
    func checkUrl(urlString: String) -> String {
        if let url = URL(string: urlString) {
            var result: String!
            let sessionDelegate = SessionDelegate()
            let urlSession = URLSession(configuration: .default, delegate: sessionDelegate, delegateQueue: nil)
            
            let semaphore = DispatchSemaphore(value: 0)  //1. create a counting semaphore


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
                
                semaphore.signal()  //3. count it up
            }).resume()

            semaphore.wait()  //2. wait for finished counting

            return result
        }

        return "No result"
    }
    
    func loadResult( urlPath: String )->String {
        //let urlPath1  = "https://ehsmetrics.thefacebook.com/RestController.php?api=getEhsUsers"
        //let urlPath = "https://api.openweathermap.org/data/2.5/weather?lat=52.41&lon=0.28&units=metric&APPID=688d12280e70dc916acabe2705999354"
        //let urlPath2 = "https://ehsmetrics.thefacebook.com/RestController.php?api=searchUsers&name=john"
        
        //let session = URLSession.shared
        let url = URL(string: urlPath)!
        let sessionDelegate = SessionDelegate()
        let urlSession = URLSession(configuration: .default, delegate: sessionDelegate, delegateQueue: nil)
        
        var result = String("no result")
        
        let dataTask = urlSession.dataTask(with: url ){
            (data:Data?, response: URLResponse?, error:Error? ) in
            if let e = error {
                print( "URL Data Error:\n" )
                print(e)
            }else {
                // get the data if any...
                if let data = data {
                    let dataString = String(data:data, encoding: String.Encoding.utf8)
                    print( dataString! )
                    
                     /*
                     if let jsonObj = ((try?JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary) as  NSDictionary??){
                        // checkn the dictionary contains a key called "main"
                        if let mainDictionary = jsonObj!.value(forKey: "records") as?
                            NSDictionary{
                            if let name = mainDictionary.value(forKey: "name"){
                                // get temp value and add to label
                                DispatchQueue.main.async {
                                    let myTemp = "\(name)"
                                    print(myTemp)
                                }
                            }else {
                                print("Error: unable to find name in dictionary")
                            }
                        } else {
                            print("Unable to convert json data")
                        }
                    }*/
                    //let temp = String( dataString )
                    //let myTemp = "\(String(describing: dataString))"
                    result = dataString!
                }
            }
        }
        dataTask.resume()
        
        return result
    }

}


class SessionDelegate:NSObject, URLSessionDelegate
{
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        guard challenge.previousFailureCount == 0 else {
            challenge.sender?.cancel(challenge)
            // Inform the user that the user name and password are incorrect
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        
        // Within your authentication handler delegate method, you should check to see if the challenge protection
        // space has an authentication type of NSURLAuthenticationMethodServerTrust
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust
           // and if so, obtain the serverTrust information from that protection space.
           && challenge.protectionSpace.serverTrust != nil
           && challenge.protectionSpace.host == "ehsmetrics.thefacebook.com" {
            
            //print(challenge.protectionSpace.host)
            
            let proposedCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(URLSession.AuthChallengeDisposition.useCredential, proposedCredential)
        }
        /*
        if(challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust)
        {
            print(challenge.protectionSpace.host)
            if(challenge.protectionSpace.host == "ehsmetrics.thefacebook.com")
            {
                let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
               completionHandler(URLSession.AuthChallengeDisposition.useCredential, credential)
            }
        }*/

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

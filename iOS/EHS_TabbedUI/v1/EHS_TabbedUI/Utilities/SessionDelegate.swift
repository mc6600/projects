//
//  SessionDelegate.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 3/23/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import Foundation

class SessionDelegate2:NSObject, URLSessionDelegate
{
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if(challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust)
        {
            //print(challenge.protectionSpace.host)
            if(challenge.protectionSpace.host == "ehsmetrics.thefacebook.com")
            {
                let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
               completionHandler(URLSession.AuthChallengeDisposition.useCredential, credential)
            }
        }

    }
    
    func urlSession2(_ session: URLSession,
         didReceive challenge: URLAuthenticationChallenge,
            completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        guard challenge.previousFailureCount == 0 else {
            challenge.sender?.cancel(challenge)
            // Inform the user that the user name and password are incorrect
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }

        // Within your authentication handler delegate method, you should check to see if the challenge protection space has an authentication type of NSURLAuthenticationMethodServerTrust
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust
           // and if so, obtain the serverTrust information from that protection space.
           && challenge.protectionSpace.serverTrust != nil
           && challenge.protectionSpace.host == "ehsmetrics.thefacebook.com" {
            let proposedCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(URLSession.AuthChallengeDisposition.useCredential, proposedCredential)
        }
    }
}

//
//  ViewController.swift
//  ApiumSocialLogin
//
//  Created by carloscarrera on 06/14/2018.
//  Copyright (c) 2018 carloscarrera. All rights reserved.
//

import UIKit
import ApiumSocialLogin

class ViewController: UIViewController {
    
    // MARK: Facebook Login
    var facebookSocialAuthentication: FacebookSocialAuthentication!
    
    @IBAction func facebookButtonPressed(_ sender: Any) {
        let fbConfig = SocialNetworkfConfigurationFactory.createFacebookConfiguration()
        
        let successClosure = { (userData) in
            print(userData)
        }
        
        let errorClosure = { (error) in
            print(error)
        }
        
        let facebookSocialAuthentication = FacebookSocialAuthentication(vc: self, onSuccess: successClosure, onError: errorClosure)
        facebookSocialAuthentication.login(configuration: fbConfig)
    }
    
    // MARK: Google Login
    let kGoogleReadPermissions = ["https://www.googleapis.com/auth/plus.me", "https://www.googleapis.com/auth/userinfo.profile", "https://www.googleapis.com/auth/userinfo.email"]
    let kGoogleClientId = "826010857207-umojfjg119qa12b9329t4u4ns5vsis80.apps.googleusercontent.com"
    
    var googleSocialAuthentication: GoogleSocialAuthentication!
    
    @IBAction func googleButtonPressed(_ sender: Any) {
        let googleConfig = SocialNetworkfConfigurationFactory.createGoogleConfiguration(clientId: self.kGoogleClientId, scopes: self.kGoogleReadPermissions)
        
        let successClosure = { (userData) in
            print(userData)
        }
        
        let errorClosure = { (error) in
            print(error)
        }
        
        googleSocialAuthentication = GoogleSocialAuthentication(vc: self, onSuccess: successClosure, onError: errorClosure)
        googleSocialAuthentication.login(configuration: googleConfig)
        
    }

}


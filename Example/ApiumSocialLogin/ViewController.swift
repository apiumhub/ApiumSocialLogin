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
    var facebookSocialAuthentication: SocialAuthenticationProtocol?
    let kFBReadPermissions = ["public_profile", "email", "user_friends"]
    
    @IBAction func facebookButtonPressed(_ sender: Any) {
        let fbConfig = SocialNetworkfConfigurationFactory.createFacebookConfiguration(readPermissions: kFBReadPermissions)
        
        self.facebookSocialAuthentication = FacebookSocialAuthentication(vc: self)
        self.facebookSocialAuthentication?.login(configuration: fbConfig)
        
        self.facebookSocialAuthentication?.isLoginSuccess = { (userData) in
            print(userData)
        }
        self.facebookSocialAuthentication?.isLoginFailure = { (error) in
            print(error)
        }
    }

    // MARK: Google Login
    let kGoogleReadPermissions = ["https://www.googleapis.com/auth/plus.me", "https://www.googleapis.com/auth/userinfo.profile", "https://www.googleapis.com/auth/userinfo.email"]
    let kGoogleClientId = "826010857207-umojfjg119qa12b9329t4u4ns5vsis80.apps.googleusercontent.com"
    
    var googleSocialAuthentication: SocialAuthenticationProtocol?

    @IBAction func googleButtonPressed(_ sender: Any) {
        let googleConfig = SocialNetworkfConfigurationFactory.createGoogleConfiguration(clientId: self.kGoogleClientId, scopes: self.kGoogleReadPermissions)
        
        self.googleSocialAuthentication = GoogleSocialAuthentication(vc: self)
        self.googleSocialAuthentication?.login(configuration: googleConfig)
        
        self.googleSocialAuthentication?.isLoginSuccess = { (userData) in
            print(userData)
        }
        self.googleSocialAuthentication?.isLoginFailure = { (error) in
            print(error)
        }
    }
    
}


//
//  GoogleSocialAuthentication.swift
//  SocialLoginLibrary
//
//  Created by Matias Carmona on 17/1/18.
//  Copyright © 2018 apiumhub. All rights reserved.
//

import Foundation
import GoogleSignIn

public class GoogleSocialAuthentication: BaseAuthentication, SocialAuthenticationProtocol {
    
    public func login(configuration: SocialNetworkConfiguration)  {
        
        guard let config = configuration as? GoogleConfiguration else {
            fatalError("missing configuration")
        }
        
        if let scopes = config.scopes  {
            scopes.forEach{GIDSignIn.sharedInstance().scopes.append($0)}
        }
        
        GIDSignIn.sharedInstance().clientID = config.clientId
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    public func logout() {
        GIDSignIn.sharedInstance().signOut()
    }
    
    @discardableResult public static func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any?) -> Bool {
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication,  annotation: annotation)
    }

}

extension GoogleSocialAuthentication: GIDSignInUIDelegate, GIDSignInDelegate {
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            let nsError = error as NSError
            if nsError.domain == kGIDSignInErrorDomain {
                switch nsError.code {
                case GIDSignInErrorCode.canceled.rawValue:
                    self.onError(.canceled)
                default:
                    self.onError(.failed)
                }
            }
        } else {
            guard let currentUser = GIDSignIn.sharedInstance().currentUser,
                let userID = currentUser.userID,
                let token = currentUser.authentication.accessToken else {
                    self.onError(.failed)
                    return
            }
            
            self.onSuccess(UserAuthenticationResponseData(userId: userID, token: token, email: currentUser.profile.email))
        }
    }
    
    public func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        viewController.modalPresentationStyle = .overCurrentContext
        self.viewController?.present(viewController, animated: true)
    }
    
    public func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        viewController.dismiss(animated: true)
    }

}

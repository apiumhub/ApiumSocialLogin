//
//  SocialAuthentication.swift
//  SocialLoginLibrary
//
//  Created by Matias Carmona on 17/1/18.
//  Copyright © 2018 apiumhub. All rights reserved.
//

import Foundation
import FacebookLogin
import FacebookCore

@objcMembers public class FacebookSocialAuthentication: BaseAuthentication, SocialAuthenticationProtocol {
    
    let loginManager = LoginManager()
    
    public func login(configuration: SocialNetworkConfiguration) {
        
        guard let config = configuration as? FacebookConfiguration else {
            fatalError("missing configuration")
        }
        
        loginManager.loginBehavior = .native
        loginManager.logIn(readPermissions: config.readPermissions, viewController: self.viewController) { (loginResult) in
            
            switch loginResult {
            case .success(let accessToken):
                self.getUserDataFromGraph(parameters: ["fields": "email"], token:accessToken.token , completion: { (data) in
                    if let dt = data, let email = dt["email"] as? String, let id = dt["id"] as? String {
                        let userData = UserDataFactory.makeFacebookUserData(userId:id,
                                                                            token: accessToken.token.authenticationToken,
                                                                            email: email)
                        self.onSuccess(userData)
                    } else {
                        self.onError(.noEmail)
                    }
                })
                
            case .cancelled:
                self.onError(.canceled)
                return
                
            case .failed:
                self.onError(.failed)
                return
            }
        }
    }
    
    private func getUserDataFromGraph(parameters: [String: String],token: AccessToken , completion: @escaping ([String : AnyObject]?) -> ())  {
        
        GraphRequest(graphPath: "me", parameters: parameters, accessToken: token, httpMethod: .GET, apiVersion: .defaultVersion).start { (urlResponse, requestResult) in
            
            switch requestResult {
            case .failed:
                self.onError(.failed)
                break
                
            case .success(let graphResponse):
                if let responseDictionary = graphResponse.dictionaryValue {
                    completion(responseDictionary as [String : AnyObject])
                }
            }
        }
    }
    
    public func logout() {
        loginManager.logOut()
    }
    
    
    public static func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any?) -> Bool {
        return SDKApplicationDelegate.shared.application(application, open: url)
    }
    
    public static func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool  {
        return SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
}

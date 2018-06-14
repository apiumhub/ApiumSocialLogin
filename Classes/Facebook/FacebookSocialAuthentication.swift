//
//  SocialAuthentication.swift
//  SocialLoginLibrary
//
//  Created by Matias Carmona on 17/1/18.
//  Copyright © 2018 apiumhub. All rights reserved.
//

import Foundation
import FBSDKLoginKit

@objcMembers public class FacebookSocialAuthentication: NSObject, SocialAuthenticationProtocol {
    
    public weak var viewController: UIViewController?
    public var isLoginSuccess: ((UserAuthenticationResponseData) -> Void)?
    public var isLoginFailure: ((SocialAuthenticationError) -> Void)?
    
    public init(vc: UIViewController) {
        self.viewController = vc
    }
    
    public func login(configuration: SocialNetworkConfiguration) {
        
        guard let config = configuration as? FacebookConfiguration else {
            self.isLoginFailure?(.failed)
            return
        }
        FBSDKSettings.setAutoLogAppEventsEnabled(0)
        // TEST ERROR
        let fbManager = FBSDKLoginManager()
        fbManager.loginBehavior = .native
        fbManager.logIn(withReadPermissions: config.readPermissions, from: self.viewController)  {
            (result, error) in
            
            guard error == nil else {
                self.isLoginFailure?(.failed)
                return
            }
            guard result?.isCancelled == false else {
                self.isLoginFailure?(.canceled)
                return
            }
            // Check email
            self.getUserDataFromGraph(parameters: ["fields": "email"], completion: { (data) in
                if let dt = data, let email = dt["email"] as? String {
                    let userData = UserDataFactory.makeFacebookUserData(userId: FBSDKAccessToken.current().userID,
                                                                        token: FBSDKAccessToken.current().tokenString,
                                                                        email: email)
                    self.isLoginSuccess?(userData)
                } else {
                  self.isLoginFailure?(.noEmail)
                }
            })
        }
    }
    
    private func getUserDataFromGraph(parameters: [String: String], completion: @escaping ([String : AnyObject]?) -> ())  {
        
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start {
            (connection, result, error) in
            if error == nil, let data = result as? [String : AnyObject] {
                completion(data)
            } else {
                completion(nil)
            }
        }
    }

    public func logout() {
        let fbManager = FBSDKLoginManager()
        fbManager.loginBehavior = .native
        fbManager.logOut()
    }

    @discardableResult
    public static func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    @discardableResult
    public static func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool  {
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }

}

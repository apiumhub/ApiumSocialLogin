//
//  BaseAuthentication.swift
//  ApiumSocialLogin
//
//  Created by Bruno on 5/7/18.
//

import Foundation

public class BaseAuthentication: NSObject {
    
    public weak var viewController: UIViewController?
    internal let onSuccess: ((UserAuthenticationResponseData) -> Void)
    internal let onError: ((SocialAuthenticationError) -> Void)
    
    
    public init(vc: UIViewController, onSuccess: @escaping ((UserAuthenticationResponseData) -> Void),  onError: @escaping ((SocialAuthenticationError) -> Void)) {
        self.viewController = vc
        self.onSuccess = onSuccess
        self.onError = onError
    }
    
}
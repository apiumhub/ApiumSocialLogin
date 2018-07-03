
//
//  SocialAuthentication.swift
//  SocialLoginLibrary
//
//  Created by Matias Carmona on 17/1/18.
//  Copyright © 2018 apiumhub. All rights reserved.
//

import UIKit

public protocol SocialAuthenticationProtocol {
    var viewController: UIViewController? { get set }
    func login(configuration: SocialNetworkConfiguration)
    func logout() -> Void
    var isLoginSuccess: ((_ userData: UserAuthenticationResponseData) -> Void)? { get set }
    var isLoginFailure: ((_ error: SocialAuthenticationError) -> Void)? { get set }
}

public struct UserAuthenticationResponseData {
    public let userId: String
    public let token: String
    public let email: String
}

public enum SocialAuthenticationError: Int, CustomStringConvertible {
    
    case canceled = 0
    case failed = 1
    case noEmail = 2
    
    public var description: String {
        switch self {
        case .canceled: return "CANCELED"
        case .failed: return "FAILED"
        case .noEmail: return "NOEMAIL"
        }
    }
}

public enum SocialNetworkType: Int, CustomStringConvertible {
    
    case facebook = 0
    case google = 1
    
    public var description: String {
        switch self {
        case .facebook: return "FACEBOOK"
        case .google: return "GOOGLE"
        }
    }
}

enum LoginResult {
    case success
    case failure(error: SocialAuthenticationError)
}

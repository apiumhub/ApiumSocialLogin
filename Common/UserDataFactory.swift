//
//  SocialAuthentication.swift
//  SocialLoginLibrary
//
//  Created by Matias Carmona on 17/1/18.
//  Copyright © 2018 apiumhub. All rights reserved.
//

class UserDataFactory {
    
    internal static func makeFacebookUserData(userId: String, token: String, email: String) -> UserAuthenticationResponseData {
        return UserAuthenticationResponseData(userId: userId, token: token, email: email)
    }
    
    internal static func makeGoogleUserData(userId: String, token: String, email: String) -> UserAuthenticationResponseData {
        return UserAuthenticationResponseData(userId: userId, token: token, email: email)
    }
}

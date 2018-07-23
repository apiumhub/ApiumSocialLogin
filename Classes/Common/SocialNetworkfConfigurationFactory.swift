//
//  SocialNetworkfConfigurationFactory.swift
//  SocialLoginLibrary
//
//  Created by Matias Carmona on 16/1/18.
//  Copyright © 2018 apiumhub. All rights reserved.
//

import Foundation

public protocol SocialNetworkConfiguration: class { }

public class SocialNetworkfConfigurationFactory {
    
    public static func createFacebookConfiguration(readPermissions: [Permissions] = [.basic]) -> FacebookConfiguration {
        return FacebookConfiguration(readPermissions: map(readPermissions))
    }
    
    public static func createGoogleConfiguration(clientId: String, scopes: [String]?) -> GoogleConfiguration {
        return GoogleConfiguration(clientId: clientId, scopes: scopes)
    }
    
    public static func createWeChatConfiguration(appId: String, appSecret: String) -> WeChatConfiguration {
        return WeChatConfiguration(appId: appId, appSecret: appSecret)
    }
    
    public static func map(_ permissions: [Permissions]) -> Set<String> {
        return Set(permissions.map {$0.toFacebookPermission()}.flatMap{$0})
    }
    
}

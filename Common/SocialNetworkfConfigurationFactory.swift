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
    
    public static func createFacebookConfiguration(readPermissions: [String]) -> FacebookConfiguration {
        return FacebookConfiguration(readPermissions: readPermissions)
    }
    
    public static func createGoogleConfiguration(clientId: String, scopes: [String]?) -> GoogleConfiguration {
        return GoogleConfiguration(clientId: clientId, scopes: scopes)
    }
    
}

//
//  FacebookConfiguration.swift
//  SocialLoginLibrary
//
//  Created by Matias Carmona on 14/1/18.
//  Copyright © 2018 apiumhub. All rights reserved.
//

import Foundation

public class FacebookConfiguration: NSObject, SocialNetworkConfiguration {
    
    internal let readPermissions: [String]
    
    public init(readPermissions: [String]) {
        self.readPermissions = readPermissions
    }
    
}

//
//  GoogleConfigurationModel.swift
//  SocialLoginLibrary
//
//  Created by Matias Carmona on 14/1/18.
//  Copyright © 2018 apiumhub. All rights reserved.
//

import Foundation

public class GoogleConfiguration: NSObject, SocialNetworkConfiguration {
    
    internal let clientId: String
    internal let scopes: [String]?
    
     public init(clientId: String, scopes: [String]?) {
        self.clientId = clientId
        self.scopes = scopes
    }
    
}


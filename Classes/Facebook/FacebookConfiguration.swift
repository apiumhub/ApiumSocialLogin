//
//  FacebookConfiguration.swift
//  SocialLoginLibrary
//
//  Created by Matias Carmona on 14/1/18.
//  Copyright © 2018 apiumhub. All rights reserved.
//

import Foundation
import FacebookCore

public class FacebookConfiguration: NSObject, SocialNetworkConfiguration {
    
    internal var readPermissions: [ReadPermission] = []
    
    public init(readPermissions: [String]) {
        self.readPermissions = readPermissions.map{ReadPermission.custom($0)}
    }
}

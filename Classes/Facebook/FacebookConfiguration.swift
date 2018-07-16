//
//  FacebookConfiguration.swift
//  SocialLoginLibrary
//
//  Created by Matias Carmona on 14/1/18.
//  Copyright © 2018 apiumhub. All rights reserved.
//

import Foundation
import FacebookCore

public class FacebookConfiguration: SocialNetworkConfiguration {
    
    internal var readPermissions: Set<String>
    
    init(readPermissions: Set<String>) {
        self.readPermissions = readPermissions
    }
}

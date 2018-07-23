//
//  WeChatConfiguration.swift
//  ApiumSocialLogin
//
//  Created by Bruno on 23/7/18.
//

import Foundation

public class WeChatConfiguration: SocialNetworkConfiguration {
    
    var appId: String
    var appSecret: String
    
    init(appId: String, appSecret: String) {
        self.appId = appId
        self.appSecret = appSecret
    }
    
}

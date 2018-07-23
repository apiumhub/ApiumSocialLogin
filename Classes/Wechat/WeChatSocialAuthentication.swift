//
//  WeChatSocialAuthentication.swift
//  ApiumSocialLogin
//
//  Created by Bruno on 23/7/18.
//

import Foundation
import ApiumWechatKit

public class WeChatSocialAuthentication: BaseAuthentication, SocialAuthenticationProtocol {
    
    var wechatManager: WechatManager = WechatManager.shared

    public func login(configuration: SocialNetworkConfiguration) {
        guard let config = configuration as? WeChatConfiguration else {
            fatalError("missing configuration")
        }
        wechatManager.setupManager(appSecret: config.appSecret, appid: config.appId)
        wechatManager.login()
    }
    
    public func logout() {
        
    }

}

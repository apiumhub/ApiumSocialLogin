//
//  WechatManager.swift
//  ApiumSocialLogin
//
//  Created by Bruno on 17/7/18.
//

import Foundation

public class WechatManager: NSObject {
    
    public static var appid: String! {
        didSet {
         WXApi.getVersion()
        }
    }
}

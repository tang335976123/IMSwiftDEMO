//
//  TIMManagerinit.swift
//  SwiftDemo
//
//  Created by edz on 2020/12/14.
//

import UIKit
import ImSDK
class TIMManagerinit:NSObject,V2TIMSDKListener{
     
    class var sharedInstance:TIMManagerinit{
        struct Static{
            static let instance:TIMManagerinit = TIMManagerinit()
        }
        
        return Static.instance
    }
    
    func instantiation(){
        let config = V2TIMSDKConfig.init()
        V2TIMManager.sharedInstance().initSDK(SDKAPPID, config: config, listener: self)
    }
    
    func onConnecting(){
        print("正在连接到腾讯云服务器")
    }
    
    func onConnectSuccess(){
        print("已经成功连接到腾讯云服务器")
    }
    
    func onConnectFailed(){
        print("连接腾讯云服务器失败")
    }
}

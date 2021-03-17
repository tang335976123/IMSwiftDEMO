//
//  ViewController.swift
//  IMSDKSwiftDemo
//
//  Created by edz on 2021/3/17.
//

import UIKit
import ImSDK
class ViewController: UIViewController {
    /*首先要实例化对像 登录*/

    override func viewDidLoad() {
        super.viewDidLoad()

        TIMManagerinit.sharedInstance.instantiation()

        self.login()
    }

    func login() {
        let parm = TIMLoginParam.init()
        parm.identifier = "55"
        parm.userSig = GenerateTestUserSig.genTestUserSig(parm.identifier)
        V2TIMManager.sharedInstance()?.login(parm.identifier, userSig: parm.userSig, succ: {
            print("登录成功")
        }, fail: { (Int32, _: String?) in
            print("登录失败")
        })
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        let msg = V2TIMManager.sharedInstance()?.createTextMessage("hello")
        V2TIMManager.sharedInstance()?.send(msg, receiver: "66", groupID: nil, priority: V2TIMMessagePriority.PRIORITY_DEFAULT, onlineUserOnly: false, offlinePushInfo: nil, progress: nil, succ: {
            print("消息发送成功")
        }, fail: { (Int32, _: String?) in
            print("消息发送失败")
        })
    }
    
}


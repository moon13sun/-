//
//  ViewController.swift
//  循环引用
//
//  Created by leergou on 16/7/16.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 声明一个闭包
    var closure:(() -> ())?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 解决闭包循环引用
        
        // 方式01(iOS 5.0)
//        closure = {[weak self] () -> () in
//            
//            print(self?.view) // 要加 '?'
//            
//        }
        
        // 方式02(iOS 4.0)
//        closure = {[unowned self] () -> () in
//            
//            print(self.view) // 不加 '?'
//            
//        }
        
        // 方式03
        weak var weakSelf = self
        closure = { () -> () in
            
            
            print(weakSelf?.view)
        }

    }
    
    
    /**
     析构函数:(与构造函数作用想法)
     - 什么时候会走 deinit
     01- 对象销毁
     02- 移除通知
     03- KVO
     04- NSTimer
     
     */
    deinit{
        
        print("viewController挂了")
    }
    
    

}


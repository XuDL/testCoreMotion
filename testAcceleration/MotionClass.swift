//
//  motion.swift
//  testAcceleration
//
//  Created by X-DL on 15/4/11.
//  Copyright (c) 2015年 dl. All rights reserved.
//

import UIKit
import CoreMotion


protocol MotionDelegate:NSObjectProtocol{
    func updateXY(X:Double,Y:Double,Z:Double)
}

class MotionClass:UIView{
    /// 创建协议实例
    weak var delegate : MotionDelegate?
    
    /// 创建加速度单例
    class var shareMotion: CMMotionManager {
        struct MotionStruct{
            static var motionManager:CMMotionManager?
            static var token:dispatch_once_t = 0
        }
        dispatch_once(&MotionStruct.token) {
            if MotionStruct.motionManager == nil
            {
                MotionStruct.motionManager = CMMotionManager()
            }
        }
        return MotionStruct.motionManager!
    }
    
    /**
    开始加速度检测方法
    */
    func startMotion(){
        let motion = MotionClass.shareMotion
        if motion.gyroAvailable {
            motion.accelerometerUpdateInterval = NSTimeInterval(2)
            motion.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {
                (data,error) in
                
                let x = data.acceleration.x
                let y = data.acceleration.y
                let z = data.acceleration.z
                //调用协议，传入参数
                self.delegate?.updateXY(x,Y:y,Z:z)
            })
        }else{
            println("motino is false")
        }
    }
    /**
    停止加速度检测
    */
    func stopMotion(){
        MotionClass.shareMotion.stopAccelerometerUpdates()
    }
}
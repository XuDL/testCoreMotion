//
//  ViewController.swift
//  testAcceleration
//
//  Created by X-DL on 15/4/11.
//  Copyright (c) 2015年 dl. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController,MotionDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let monitionManager = MotionClass.shareMotion
        let motion = MotionClass()
        motion.delegate = self
        motion.startMotion()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(sender: UIButton) {
        println("motion is stop")
        let motion = MotionClass()
        motion.stopMotion()
    }
    func updateXY(X: Double, Y: Double, Z: Double) {
        println("X:\(X)\tY:\(Y)\tZ:\(Z)")
    }
}


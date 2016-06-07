//
//  ViewController.swift
//  AddEQ
//
//  Created by Bruce on 16/6/7.
//  Copyright © 2016年 Bruce. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    lazy var engine = AVAudioEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let intput = engine.inputNode!
        let output = engine.outputNode
        
//        创建设置只有一组EQ
        let eq = AVAudioUnitEQ.init(numberOfBands: 1)
//        获得EQ效果的参数
        let filer = eq.bands.first
//        设置 低通效果
        filer?.filterType = .LowPass
//        设置频宽
        filer?.bandwidth = 10
//        设置增益
        filer?.gain = 20
        
//        将EQ附着到 音频引擎
        engine.attachNode(eq)
        
//        开始连接各个节点
        engine.connect(intput, to: eq, format: intput.inputFormatForBus(0))
        engine.connect(eq, to: output, format: intput.inputFormatForBus(0))
        
//        开启引擎
        try! engine.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


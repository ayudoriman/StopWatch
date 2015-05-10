//
//  ViewController.swift
//  StopWatch
//
//  Created by KFCC on 2015/05/10.
//  Copyright (c) 2015年 KFCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Label: UILabel!
    @IBOutlet var hanteiLabel: UILabel!
    
    var count: Float = 0.0
    var timer: NSTimer = NSTimer()
    
    func up(){
        count = count + 0.001
        Label.text = String(format: "%.3f", count)
    }
    
    func hantei(){
        if 9.80<=count&&count<=10.20 {
            hanteiLabel.text = "PERFECT!!"
            hanteiLabel.textColor = UIColor.redColor()
        }else if 9.70<=count&&count<=10.30 {
            hanteiLabel.text = "GREAT!!"
            hanteiLabel.textColor = UIColor.yellowColor()
        }else if 9.50<=count&&count<=10.50 {
            hanteiLabel.text = "GOOD!!"
            hanteiLabel.textColor = UIColor.greenColor()
        }else{
            hanteiLabel.text = "BAD..."
            hanteiLabel.textColor = UIColor.blackColor()
        }
    }
    
    @IBAction func start(){
        if timer.valid{
            timer.invalidate()
            hantei()
        }else if !timer.valid{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.001,
                target: self,
                selector: Selector("up"),
                userInfo: nil,
                repeats: true)
        }
    }
    
    @IBAction func clear(){
        if timer.valid{
            timer.invalidate()
        }else{
            timer.invalidate()
            count = 0.0
            Label.text = String(format: "%.3f", count)
            hanteiLabel.text = ""

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hanteiLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


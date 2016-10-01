//
//  SecondViewController.swift
//  TimeCount
//
//  Created by Duncan on 2016/3/4.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit
import AudioToolbox

var reminderTimeArray2 = ["150", "130", "110", "10"]

class SecondViewController: UIViewController {
    var countingSecond = Int(reminderTimeArray2[0])
    var countingSecond2 = Int(reminderTimeArray2[0])
    var isRed3 = false
    var isRed4 = false
    var timer3:NSTimer?
    var timer4:NSTimer?
    var blinkTimer3:NSTimer?
    var blinkTimer4:NSTimer?
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var showingTimeText: UILabel!
    
    //每秒執行一次的部分
    func countingPerSecond(){
        countingSecond = countingSecond! - 1
        showingTimeText.text = "\(countingSecond!/60)" + "分" + "\(countingSecond!%60)" + "秒"
        
        if countingSecond == Int(reminderTimeArray2[1]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer3 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(SecondViewController.BlinkLeft3), userInfo: nil, repeats: true)
        }else if countingSecond == Int(reminderTimeArray2[2]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer3 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(SecondViewController.BlinkLeft3), userInfo: nil, repeats: true)
        }else if countingSecond == Int(reminderTimeArray2[3]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer3 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(SecondViewController.BlinkLeft3), userInfo: nil, repeats: true)
        }else if countingSecond == 0{
            AudioServicesPlaySystemSound(1304)
            blinkTimer3 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(SecondViewController.BlinkLeft3), userInfo: nil, repeats: true)
            pauseButton.hidden = true
            playButton.hidden = true
            restartButton.hidden = false
            timer3?.invalidate()
        }
    }
    
    var blinkTimes3 = 8
    func BlinkLeft3(){
        blinkTimes3 = blinkTimes3 - 1
        if isRed3 == false{
            showingTimeText.textColor = UIColor.redColor()
            isRed3 = true
        }else{
            showingTimeText.textColor = UIColor.blackColor()
            isRed3 = false
        }
        if blinkTimes3 == 0{
            blinkTimer3?.invalidate()
            blinkTimes3 = 8
        }
    }
    
    @IBAction func playButtonPressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        playButton.hidden = true
        pauseButton.hidden = false
        restartButton.hidden = true
        timer3 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(SecondViewController.countingPerSecond), userInfo: nil, repeats: true)
    }
    @IBAction func pauseButtonPressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        pauseButton.hidden = true
        playButton.hidden = false
        restartButton.hidden = false
        timer3?.invalidate()
    }
    @IBAction func restartButtonPressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        restartButton.hidden = true
        playButton.hidden = false
        pauseButton.hidden = true
        countingSecond = Int(reminderTimeArray2[0])
        showingTimeText.text = "\(countingSecond!/60)" + "分" + "\(countingSecond!%60)" + "秒"
        
        flavorImage1.setImage(UIImage(named: "Origin"), forState: .Normal)
        flavorImage2.setImage(UIImage(named: "Origin"), forState: .Normal)
    }

    override func viewWillAppear(animated: Bool) {
        timer3?.invalidate()
        restartButton.hidden = true
        playButton.hidden = false
        pauseButton.hidden = true
        countingSecond = Int(reminderTimeArray2[0])
        showingTimeText.text = "\(countingSecond!/60)" + "分" + "\(countingSecond!%60)" + "秒"
        
        timer4?.invalidate()
        restartButton2.hidden = true
        playButton2.hidden = false
        pauseButton2.hidden = true
        countingSecond2 = Int(reminderTimeArray2[0])
        showingTextLebal2.text = "\(countingSecond2!/60)" + "分" + "\(countingSecond2!%60)" + "秒"
        
        
        if NSUserDefaults.standardUserDefaults().objectForKey("reminderTime2") != nil{
            reminderTimeArray2.removeAll(keepCapacity: true)
            reminderTimeArray2 = NSUserDefaults.standardUserDefaults().objectForKey("reminderTime2") as! Array
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //第三次修改口味按鈕
    
    
    
    
    
    //從這邊開始寫右邊畫面
    
    @IBOutlet weak var playButton2: UIButton!
    @IBOutlet weak var pauseButton2: UIButton!
    @IBOutlet weak var restartButton2: UIButton!
    @IBOutlet weak var showingTextLebal2: UILabel!
    
    //每秒執行一次
    func countingPerSecond2(){
        countingSecond2 = countingSecond2! - 1
        showingTextLebal2.text = "\(countingSecond2!/60)" + "分" + "\(countingSecond2!%60)" + "秒"
        if countingSecond2 == Int(reminderTimeArray2[1]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer4 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(SecondViewController.BlinkLeft4), userInfo: nil, repeats: true)
        }else if countingSecond2 == Int(reminderTimeArray2[2]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer4 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(SecondViewController.BlinkLeft4), userInfo: nil, repeats: true)
        }else if countingSecond2 == Int(reminderTimeArray2[3]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer4 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(SecondViewController.BlinkLeft4), userInfo: nil, repeats: true)
        }else if countingSecond2 == 0{
            AudioServicesPlaySystemSound(1304)
            blinkTimer4 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(SecondViewController.BlinkLeft4), userInfo: nil, repeats: true)
            pauseButton2.hidden = true
            playButton2.hidden = true
            restartButton2.hidden = false
            timer4?.invalidate()
        }
    }
    
    @IBOutlet weak var flavorImage1: UIButton!
    var blinkTimes4 = 8
    func BlinkLeft4(){
        blinkTimes4 = blinkTimes4 - 1
        if isRed4 == false{
            showingTextLebal2.textColor = UIColor.redColor()
            isRed4 = true
        }else{
            showingTextLebal2.textColor = UIColor.blackColor()
            isRed4 = false
        }
        if blinkTimes4 == 0{
            blinkTimer4?.invalidate()
            blinkTimes4 = 8
        }
    }
    
    @IBAction func playButton2Pressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        playButton2.hidden = true
        pauseButton2.hidden = false
        restartButton2.hidden = true
        timer4 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(SecondViewController.countingPerSecond2), userInfo: nil, repeats: true)
    }
    @IBAction func pauseButton2Pressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        pauseButton2.hidden = true
        playButton2.hidden = false
        restartButton2.hidden = false
        timer4?.invalidate()
    }
    @IBAction func restartButton2Pressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        restartButton2.hidden = true
        playButton2.hidden = false
        pauseButton2.hidden = true
        countingSecond2 = Int(reminderTimeArray2[0])
        showingTextLebal2.text = "\(countingSecond2!/60)" + "分" + "\(countingSecond2!%60)" + "秒"
    }
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    var imageIndex1 = 0
    @IBOutlet weak var flavorImage2: UIButton!
    var imageIndex2 = 0
    
    @IBAction func flavorButton1(sender: AnyObject) {
        imageIndex1 += 1
        guard imageIndex1 < 5 else{
            imageIndex1 = 0
            flavorImage1.setImage(UIImage(named: "Origin"), forState: .Normal)
            return
        }
        switch imageIndex1 {
        case 0: flavorImage1.setImage(UIImage(named: "Origin"), forState: .Normal)
        case 1: flavorImage1.setImage(UIImage(named: "Chocolate"), forState: .Normal)
        case 2: flavorImage1.setImage(UIImage(named: "Cheese"), forState: .Normal)
        case 3: flavorImage1.setImage(UIImage(named: "Peanut"), forState: .Normal)
        case 4: flavorImage1.setImage(UIImage(named: "Coconut"), forState: .Normal)
        default: break
        }
    }
    @IBAction func flavorButton2(sender: AnyObject) {
        imageIndex2 += 1
        guard imageIndex2 < 5 else{
            imageIndex2 = 0
            flavorImage2.setImage(UIImage(named: "Origin"), forState: .Normal)
            return
        }
        switch imageIndex2 {
        case 0: flavorImage2.setImage(UIImage(named: "Origin"), forState: .Normal)
        case 1: flavorImage2.setImage(UIImage(named: "Chocolate"), forState: .Normal)
        case 2: flavorImage2.setImage(UIImage(named: "Cheese"), forState: .Normal)
        case 3: flavorImage2.setImage(UIImage(named: "Peanut"), forState: .Normal)
        case 4: flavorImage2.setImage(UIImage(named: "Coconut"), forState: .Normal)
        default: break
        }
    }
    
}



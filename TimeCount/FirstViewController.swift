//
//  FirstViewController.swift
//  TimeCount
//
//  Created by Duncan on 2016/3/4.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit
import AudioToolbox

var reminderTimeArray = ["20", "40", "140", "150"]

class FirstViewController: UIViewController {
    var timeSecond0 = 0
    var timeSecond1 = 0
    var isRed0 = false
    var isRed1 = false
    var timer0:NSTimer?
    var timer1:NSTimer?
    var blinkTimer0:NSTimer?
    var blinkTimer1:NSTimer?
    
    @IBOutlet weak var playButton0: UIButton!
    @IBOutlet weak var pauseButton0: UIButton!
    @IBOutlet weak var restartButton0: UIButton!
    @IBOutlet weak var showingTimeLabel0: UILabel!

    @IBOutlet weak var originButton0: UIButton!
    @IBOutlet weak var chotolateButton0: UIButton!
    @IBOutlet weak var cheeseButton0: UIButton!
    @IBOutlet weak var peanutButton0: UIButton!
    @IBOutlet weak var coconutButton0: UIButton!
    
    var buttonArray0: [UIButton] = []
    
    func setAllButtonToGray(){
        originButton0.setImage(UIImage(named :"OriginGray"), forState: .Normal)
        chotolateButton0.setImage(UIImage(named: "ChocolateGray"), forState: .Normal)
        cheeseButton0.setImage(UIImage(named :"CheeseGray"), forState: .Normal)
        peanutButton0.setImage(UIImage(named: "PeanutGray"), forState: .Normal)
        coconutButton0.setImage(UIImage(named: "CoconutGray"), forState: .Normal)
    }
    
    //五個按鈕一個function
    @IBAction func changeColor(sender: UIButton) {
        //setAllButtonToGray()
        switch sender.tag {
        case 0: myFlavorButton0.setImage(UIImage(named :"Origin"), forState: .Normal)
        case 1: myFlavorButton0.setImage(UIImage(named: "Chocolate"), forState: .Normal)
        case 2: myFlavorButton0.setImage(UIImage(named :"Cheese"), forState: .Normal)
        case 3: myFlavorButton0.setImage(UIImage(named: "Peanut"), forState: .Normal)
        case 4: myFlavorButton0.setImage(UIImage(named: "Coconut"), forState: .Normal)
        
        default: break
        }
        hideAllButton0()
    }
    
    
    
    //每秒執行
    func countingPerSecond0(){
        timeSecond0 += 1
        showingTimeLabel0.text = "\(timeSecond0/60)" + "分" + "\(timeSecond0%60)" + "秒"
        
        if timeSecond0 == Int(reminderTimeArray[0]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer0 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(FirstViewController.BlinkLeft0), userInfo: nil, repeats: true)
        }else if timeSecond0 == Int(reminderTimeArray[1]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer0 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(FirstViewController.BlinkLeft0), userInfo: nil, repeats: true)
        }else if timeSecond0 == Int(reminderTimeArray[2]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer0 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(FirstViewController.BlinkLeft0), userInfo: nil, repeats: true)
        }else if timeSecond0 == Int(reminderTimeArray[3]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer0 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(FirstViewController.BlinkLeft0), userInfo: nil, repeats: true)
            pauseButton0.hidden = true
            playButton0.hidden = false
            restartButton0.hidden = false
            timer0?.invalidate()
        }
    }
    var blinkTimes0 = 8
    func BlinkLeft0(){
        blinkTimes0 = blinkTimes0 - 1
        if isRed0 == false{
            showingTimeLabel0.textColor = UIColor.redColor()
            isRed0 = true
        }else{
            showingTimeLabel0.textColor = UIColor.blackColor()
            isRed0 = false
        }
        if blinkTimes0 == 0{
            blinkTimer0?.invalidate()
            blinkTimes0 = 8
        }
    }
    
    @IBAction func playButton0Pressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        playButton0.hidden = true
        pauseButton0.hidden = false
        restartButton0.hidden = true
        timer0 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(FirstViewController.countingPerSecond0), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButton0Pressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        pauseButton0.hidden = true
        playButton0.hidden = false
        restartButton0.hidden = false
        timer0?.invalidate()
    }
    
    @IBAction func restartButton0Pressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        restartButton0.hidden = true
        playButton0.hidden = false
        pauseButton0.hidden = true
        timeSecond0 = 0
        showingTimeLabel0.text = "\(timeSecond0/60)" + "分" + "\(timeSecond0%60)" + "秒"
        //setAllButtonToGray()
        myFlavorButton0.setImage(UIImage(named: "OriginGray"), forState: .Normal)
        myFlavorButton2.setImage(UIImage(named: "OriginGray"), forState: .Normal)
    }
    //第三次修改口味按鈕
    @IBOutlet weak var myFlavorButton0: UIButton!
    
    @IBAction func flavorChoose(sender: AnyObject) {
        if originButton0.hidden {
            showAllButton0()
        }else{
            hideAllButton0()
        }
    }
    
    
    
    func showAllButton0(){
        originButton0.hidden = false
        chotolateButton0.hidden = false
        cheeseButton0.hidden = false
        peanutButton0.hidden = false
        coconutButton0.hidden = false

    }
    
    func hideAllButton0(){
        originButton0.hidden = true
        chotolateButton0.hidden = true
        cheeseButton0.hidden = true
        peanutButton0.hidden = true
        coconutButton0.hidden = true
        
    }
    
    //以下右邊內容
    @IBOutlet weak var playButton1: UIButton!
    @IBOutlet weak var pauseButton1: UIButton!
    @IBOutlet weak var restartButton1: UIButton!
    @IBOutlet weak var showingTimeLabel1: UILabel!
    
    @IBOutlet weak var origin2: UIButton!
    @IBOutlet weak var chocolate2: UIButton!
    @IBOutlet weak var cheese2: UIButton!
    @IBOutlet weak var peanut2: UIButton!
    @IBOutlet weak var coconut2: UIButton!
    
    /*
    func turnAllButtonHighlighted(){
     
        origin2.highlighted = true
        chocolate2.highlighted = true
        cheese2.highlighted = true
        peanut2.highlighted = true
        coconut2.highlighted = true
    }
    */
    
    
    @IBAction func changeColor2(sender: UIButton) {
        /*
        turnAllButtonHighlighted()
        dispatch_async(dispatch_get_main_queue(), {
                sender.highlighted = false
        })
        */
        
        hideAllButton2()
        switch sender.tag {
        case 0: myFlavorButton2.setImage(UIImage(named :"Origin"), forState: .Normal)
        case 1: myFlavorButton2.setImage(UIImage(named: "Chocolate"), forState: .Normal)
        case 2: myFlavorButton2.setImage(UIImage(named :"Cheese"), forState: .Normal)
        case 3: myFlavorButton2.setImage(UIImage(named: "Peanut"), forState: .Normal)
        case 4: myFlavorButton2.setImage(UIImage(named: "Coconut"), forState: .Normal)
            
        default: break
        }
        
    }

    //每秒執行一次
    func countingPerSecond1(){
        timeSecond1 += 1
        showingTimeLabel1.text = "\(timeSecond1/60)" + "分" + "\(timeSecond1%60)" + "秒"
        if timeSecond1 == Int(reminderTimeArray[0]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer1 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(FirstViewController.BlinkLeft1), userInfo: nil, repeats: true)
        }else if timeSecond1 == Int(reminderTimeArray[1]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer1 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(FirstViewController.BlinkLeft1), userInfo: nil, repeats: true)
        }else if timeSecond1 == Int(reminderTimeArray[2]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer1 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(FirstViewController.BlinkLeft1), userInfo: nil, repeats: true)
        }else if timeSecond1 == Int(reminderTimeArray[3]){
            AudioServicesPlaySystemSound(1304)
            blinkTimer1 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(FirstViewController.BlinkLeft1), userInfo: nil, repeats: true)
            pauseButton1.hidden = true
            playButton1.hidden = false
            restartButton1.hidden = false
            timer1?.invalidate()
        }
    }
    
    var blinkTimes1 = 8
    func BlinkLeft1(){
        blinkTimes1 = blinkTimes1 - 1
        if isRed1 == false{
            showingTimeLabel1.textColor = UIColor.redColor()
            isRed1 = true
        }else{
            showingTimeLabel1.textColor = UIColor.blackColor()
            isRed1 = false
        }
        if blinkTimes1 == 0{
            blinkTimer1?.invalidate()
            blinkTimes1 = 8
        }
    }
    
    @IBAction func playButton1Pressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        playButton1.hidden = true
        pauseButton1.hidden = false
        restartButton1.hidden = true
        timer1 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(FirstViewController.countingPerSecond1), userInfo: nil, repeats: true)
    }
    @IBAction func pauseButton1Pressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        pauseButton1.hidden = true
        playButton1.hidden = false
        restartButton1.hidden = false
        timer1?.invalidate()
    }
    @IBAction func restartButton1Pressed(sender: UIButton) {
        AudioServicesPlaySystemSound(1105)
        restartButton1.hidden = true
        playButton1.hidden = false
        pauseButton1.hidden = true
        timeSecond1 = 0
        showingTimeLabel1.text = "\(timeSecond1/60)" + "分" + "\(timeSecond1%60)" + "秒"
        //turnAllButtonHighlighted()
        myFlavorButton3.setImage(UIImage(named: "OriginGray"), forState: .Normal)
        myFlavorButton4.setImage(UIImage(named: "OriginGray"), forState: .Normal)
    }
    
    //左畫面的右邊---第三次修改口味按鈕
    
    @IBOutlet weak var myFlavorButton2: UIButton!
    @IBAction func myFlavorButton1(sender: AnyObject) {
        
        if origin2.hidden {
            showAllButton2()
        }else{
            hideAllButton2()
        }
    }
    
    func showAllButton2(){
        origin2.hidden = false
        chocolate2.hidden = false
        cheese2.hidden = false
        peanut2.hidden = false
        coconut2.hidden = false
        
    }
    
    func hideAllButton2(){
        origin2.hidden = true
        chocolate2.hidden = true
        cheese2.hidden = true
        peanut2.hidden = true
        coconut2.hidden = true
        
    }
    
    //右畫面---第三次修改口味按鈕
    
    
    @IBOutlet weak var myFlavorButton3: UIButton!    
    @IBOutlet weak var myFlavorButton4: UIButton!
    
    @IBOutlet weak var flavorImage40: UIButton!
    @IBOutlet weak var flavorImage43: UIButton!
    @IBOutlet weak var flavorImage41: UIButton!
    @IBOutlet weak var flavorImage44: UIButton!    
    @IBOutlet weak var flavorImage30: UIButton!
    @IBOutlet weak var flavorImage32: UIButton!
    @IBOutlet weak var flavorImage34: UIButton!
    @IBOutlet weak var flavorImage33: UIButton!
    @IBOutlet weak var flavorImage31: UIButton!
    @IBOutlet weak var flavorImage42: UIButton!
    
    func flavorImageControl(tag: Int, hidden: Bool){
        if hidden{
            switch tag {
            case 3:
                flavorImage30.hidden = false
                flavorImage31.hidden = false
                flavorImage32.hidden = false
                flavorImage33.hidden = false
                flavorImage34.hidden = false
            case 4:
                flavorImage40.hidden = false
                flavorImage41.hidden = false
                flavorImage42.hidden = false
                flavorImage43.hidden = false
                flavorImage44.hidden = false
            default:
                break
            }
        }else{
            switch tag {
            case 3:
                flavorImage30.hidden = true
                flavorImage31.hidden = true
                flavorImage32.hidden = true
                flavorImage33.hidden = true
                flavorImage34.hidden = true
            case 4:
                flavorImage40.hidden = true
                flavorImage41.hidden = true
                flavorImage42.hidden = true
                flavorImage43.hidden = true
                flavorImage44.hidden = true
            default:
                break
            }
        }
    }
    
    
    
    @IBAction func flavorButtonPressedRight(sender: AnyObject) {
        
        switch sender.tag {
        case 3: flavorImageControl(3, hidden: flavorImage30.hidden)
        case 4: flavorImageControl(4, hidden: flavorImage40.hidden)
        default: break
        
        }
    }
    @IBAction func flavorChoosed(sender: AnyObject) {
        switch sender.tag {
        case 30: myFlavorButton3.setImage(UIImage(named :"Origin"), forState: .Normal)
        case 31: myFlavorButton3.setImage(UIImage(named: "Chocolate"), forState: .Normal)
        case 32: myFlavorButton3.setImage(UIImage(named :"Cheese"), forState: .Normal)
        case 33: myFlavorButton3.setImage(UIImage(named: "Peanut"), forState: .Normal)
        case 34: myFlavorButton3.setImage(UIImage(named: "Coconut"), forState: .Normal)
        
        case 40: myFlavorButton4.setImage(UIImage(named :"Origin"), forState: .Normal)
        case 41: myFlavorButton4.setImage(UIImage(named: "Chocolate"), forState: .Normal)
        case 42: myFlavorButton4.setImage(UIImage(named :"Cheese"), forState: .Normal)
        case 43: myFlavorButton4.setImage(UIImage(named: "Peanut"), forState: .Normal)
        case 44: myFlavorButton4.setImage(UIImage(named: "Coconut"), forState: .Normal)
            
        default: break
        }
        let tag = sender.tag / 10
        flavorImageControl(tag, hidden: false)
    }
    
    override func viewWillAppear(animated: Bool) {
        timer1?.invalidate()
        restartButton1.hidden = true
        playButton1.hidden = false
        pauseButton1.hidden = true
        timeSecond1 = 0
        showingTimeLabel1.text = "\(timeSecond1/60)" + "分" + "\(timeSecond1%60)" + "秒"

        timer0?.invalidate()
        restartButton0.hidden = true
        playButton0.hidden = false
        pauseButton0.hidden = true
        timeSecond0 = 0
        showingTimeLabel0.text = "\(timeSecond0/60)" + "分" + "\(timeSecond0%60)" + "秒"

        
        if NSUserDefaults.standardUserDefaults().objectForKey("reminderTime") != nil{
            reminderTimeArray.removeAll(keepCapacity: true)
            reminderTimeArray = NSUserDefaults.standardUserDefaults().objectForKey("reminderTime") as! Array
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //turnAllButtonHighlighted()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}


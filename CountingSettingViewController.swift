//
//  CountingSettingViewController.swift
//  TimeCount
//
//  Created by Duncan on 2016/3/7.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit

class CountingSettingViewController: UIViewController {
    
    @IBOutlet weak var reminder1input: UITextField!
    @IBOutlet weak var reminder2input: UITextField!
    @IBOutlet weak var reminder3input: UITextField!
    @IBOutlet weak var stopCountingTimeInput: UITextField!
    
    @IBAction func doneButton1(sender: UIButton) {
        reminder1input.resignFirstResponder()
        reminder2input.resignFirstResponder()
        reminder3input.resignFirstResponder()
        stopCountingTimeInput.resignFirstResponder()
        
        self.dismissViewControllerAnimated(true, completion: nil)
        if reminder1input.text != nil{
            reminderTimeArray[0] = reminder1input.text!
        }
        if reminder2input.text != nil{
            reminderTimeArray[1] = reminder2input.text!
        }
        if reminder3input.text != nil{
            reminderTimeArray[2] = reminder3input.text!
        }
        if stopCountingTimeInput.text != nil{
            reminderTimeArray[3] = stopCountingTimeInput.text!
        }
        NSUserDefaults.standardUserDefaults().setObject(reminderTimeArray, forKey: "reminderTime")
    }
    
    override func viewWillAppear(animated: Bool) {
        reminder1input.text = reminderTimeArray[0]
        reminder2input.text = reminderTimeArray[1]
        reminder3input.text = reminderTimeArray[2]
        stopCountingTimeInput.text = reminderTimeArray[3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminder1input.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

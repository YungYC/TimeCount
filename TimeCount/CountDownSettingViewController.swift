//
//  CountDownSettingViewController.swift
//  TimeCount
//
//  Created by Duncan on 2016/3/7.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit

class CountDownSettingViewController: UIViewController {

    @IBOutlet weak var countdownTimeInput: UITextField!
    @IBOutlet weak var reminder1Input: UITextField!
    @IBOutlet weak var reminder2Input: UITextField!
    @IBOutlet weak var reminder3Input: UITextField!
    
    @IBAction func downButton2(sender: UIButton) {
        reminder1Input.resignFirstResponder()
        reminder2Input.resignFirstResponder()
        reminder3Input.resignFirstResponder()
        countdownTimeInput.resignFirstResponder()
        
        self.dismissViewControllerAnimated(true, completion: nil)
        if reminder1Input.text != nil{
            reminderTimeArray2[1] = reminder1Input.text!
        }
        if reminder2Input.text != nil{
            reminderTimeArray2[2] = reminder2Input.text!
        }
        if reminder3Input.text != nil{
            reminderTimeArray2[3] = reminder3Input.text!
        }
        if countdownTimeInput.text != nil{
            reminderTimeArray2[0] = countdownTimeInput.text!
        }
        NSUserDefaults.standardUserDefaults().setObject(reminderTimeArray2, forKey: "reminderTime2")
    }
    
    override func viewWillAppear(animated: Bool) {
        reminder1Input.text = reminderTimeArray2[1]
        reminder2Input.text = reminderTimeArray2[2]
        reminder3Input.text = reminderTimeArray2[3]
        countdownTimeInput.text = reminderTimeArray2[0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminder1Input.becomeFirstResponder()
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

//
//  ViewController.swift
//  Prework
//
//  Created by YILDIRAY HAZIR on 2/24/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DataEnteredDelegate{
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tip1:Int=18
    var tip2:Int=20
    var tip3:Int=25
    
     var tipPercentagesArray=[0.18,0.20,0.25]
     let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Read user settings Data
        tip1 = defaults.integer(forKey:"tip1")
        tip2 = defaults.integer(forKey:"tip2")
        tip3 = defaults.integer(forKey:"tip3")
        
        let segmentlabel1:String=String(tip1)+"%"
        let segmentlabel2:String=String(tip2)+"%"
        let segmentlabel3:String=String(tip3)+"%"
        
        tipControl.setTitle(segmentlabel1, forSegmentAt: 0)
        tipControl.setTitle(segmentlabel2, forSegmentAt: 1)
        tipControl.setTitle(segmentlabel3, forSegmentAt: 2)
        tipPercentagesArray=[Double(tip1)/100.0,Double(tip2)/100.0,Double(tip3)/100.0]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let bill =  Double(billField.text!) ?? 0
        let tip = bill*Double(tipPercentagesArray[tipControl.selectedSegmentIndex])
        let total = bill + tip
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
    }

    @IBAction func onTap(_ sender: Any) {
        
        
        view.endEditing(true)
    }
    
    func userDidEnterInformation(data1: Int!, data2: Int!, data3: Int!) {
        
        tip1=data1
        tip2=data2
        tip3=data3
        
        tipPercentagesArray=[Double(data1)/100.0,Double(data2)/100.0,Double(data3)/100.0]
      
        let segmentlabel1:String=String(tip1)+"%"
        let segmentlabel2:String=String(tip2)+"%"
        let segmentlabel3:String=String(tip3)+"%"
        
        tipControl.setTitle(segmentlabel1, forSegmentAt: 0)
        tipControl.setTitle(segmentlabel2, forSegmentAt: 1)
        tipControl.setTitle(segmentlabel3, forSegmentAt: 2)
        
        defaults.set(tip1, forKey:"tip1")
        defaults.set(tip2, forKey:"tip2")
        defaults.set(tip3, forKey:"tip3")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier=="showSendingVC"{
            let sendingVC:SettingsViewController = segue.destination as! SettingsViewController
            sendingVC.delegate = self
        }
        

    }
}


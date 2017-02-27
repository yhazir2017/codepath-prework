//
//  ViewController.swift
//  Prework
//
//  Created by YILDIRAY HAZIR on 2/24/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataEnteredDelegate{
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tip1:float_t=0.18
    var tip2:float_t=0.20
    var tip3:float_t=0.25
    
    
    var tipPercentagesArray=[Float]()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //secondVC.delegate=self
    
        // Read user settings Data
        
        let defaults = UserDefaults.standard
        tip1 = defaults.float(forKey:"tip1")
        tip2 = defaults.float(forKey:"tip2")
        tip3 = defaults.float(forKey:"tip3")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
       let tipPercentagesArray=[tip1,tip2,tip3]
    
        //let tipPercentagesArray=[0.18,0.20,0.25]

        let bill =  Double(billField.text!) ?? 0
        let tip = bill*Double(tipPercentagesArray[tipControl.selectedSegmentIndex])
        let total = bill + tip
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
    }

    @IBAction func onTap(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(tip1, forKey:"tip1")
        defaults.set(tip2, forKey:"tip2")
        defaults.set(tip3, forKey:"tip3")
        
        view.endEditing(true)
    }
    
    func userDidEnterInformation(data1: Float, data2: Float, data3: Float) {
        tip1=data1
        tip2=data2
        tip3=data3
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier=="showSendingVC"{
            let sendingVC:SettingsViewController = segue.destination as! SettingsViewController
            sendingVC.delegate = self
        }
        

    }
}


//
//  ViewController.swift
//  Prework
//
//  Created by YILDIRAY HAZIR on 2/24/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages=[0.18,0.20,0.25]
        let bill =  Double(billField.text!) ?? 0
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}


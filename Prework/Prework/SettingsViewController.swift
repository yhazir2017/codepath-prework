//
//  SettingsViewController.swift
//  Prework
//
//  Created by YILDIRAY HAZIR on 2/25/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    

    @IBOutlet weak var tip1Field: UITextField!
    
    @IBOutlet weak var tip2Field: UITextField!
    
    @IBOutlet weak var tip3Field: UITextField!
    
    var delegate:DataEnteredDelegate? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if (delegate != nil){
        let tip1=Float(tip1Field.text!)
        let tip2=Float(tip2Field.text!)
        let tip3=Float(tip3Field.text!)
        print("tip1 :\(tip1) tip2:\(tip2) tip3:\(tip3)")
        delegate?.userDidEnterInformation(data1: tip1,data2: tip2,data3: tip3)
        }
    }

}

protocol DataEnteredDelegate {
    func userDidEnterInformation(data1: Float!,data2: Float!,data3: Float!)
}

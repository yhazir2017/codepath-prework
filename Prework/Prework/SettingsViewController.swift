//
//  SettingsViewController.swift
//  Prework
//
//  Created by YILDIRAY HAZIR on 2/25/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    

    @IBOutlet var settingTipView: UIView!
    @IBOutlet weak var tip1Field: UITextField!
    
    @IBOutlet weak var tip2Field: UITextField!
    
    @IBOutlet weak var tip3Field: UITextField!
    
    var delegate:DataEnteredDelegate? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         assignbackground()
        // Do any additional setup after loading the view.
         tip1Field.becomeFirstResponder()
        tip2Field.becomeFirstResponder()
        tip3Field.becomeFirstResponder()
        
        tip1Field.keyboardType=UIKeyboardType.numberPad
        tip2Field.keyboardType=UIKeyboardType.numberPad
        tip3Field.keyboardType=UIKeyboardType.numberPad
        tip1Field.keyboardAppearance = .alert
        tip2Field.keyboardAppearance = .alert
        tip3Field.keyboardAppearance = .alert
        
        
    }
    
    func assignbackground(){
        let background = UIImage(named: "money3")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        //imageView.contentMode =  UIViewContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.settingTipView.sendSubview(toBack: imageView)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if (delegate != nil){
        let tip1=Int(tip1Field.text!)
        let tip2=Int(tip2Field.text!)
        let tip3=Int(tip3Field.text!)
        delegate?.userDidEnterInformation(data1:tip1,data2:tip2,data3:tip3)
        }
    }

}

protocol DataEnteredDelegate {
    func userDidEnterInformation(data1: Int!,data2: Int!,data3: Int!)
}

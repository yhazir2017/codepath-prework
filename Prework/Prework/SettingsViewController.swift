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
    
    var tip1:Int=18
    var tip2:Int=20
    var tip3:Int=25
   
    let defaults = UserDefaults.standard
    
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
        
        // Read user settings Data
        tip1 = defaults.integer(forKey:"tip1")
        tip2 = defaults.integer(forKey:"tip2")
        tip3 = defaults.integer(forKey:"tip3")
        
        tip1Field.text!=String(tip1)
        tip2Field.text!=String(tip2)
        tip3Field.text!=String(tip3)

    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        //Moving the elements off-screen
     
        tip1Field.center.y -= view.bounds.width
        tip2Field.center.y -= view.bounds.width
        tip3Field.center.y -= view.bounds.width
    }
    override func viewDidAppear(_ animated: Bool) {
    
        
        //Achieving Fade-in animation with alpha
        UIView.animate(withDuration: 1.0, delay: 1.0,
                       options: [],
                       animations: {
                        self.tip1Field.alpha = 1.0
        }, completion: nil)
        
        //Bringing back the bill field with animation
        UIView.animate(withDuration: 2.0, animations: {
            self.tip1Field.center.y += self.view.bounds.width
        })
        
        //Achieving Fade-in animation with alpha
        UIView.animate(withDuration: 1.0, delay: 1.0,
                       options: [],
                       animations: {
                        self.tip1Field.alpha = 1.0
        }, completion: nil)
        
        //Achieving Fade-in animation with alpha
        UIView.animate(withDuration: 1.0, delay: 1.0,
                       options: [],
                       animations: {
                        self.tip2Field.alpha = 1.0
        }, completion: nil)
        
        //Bringing back the bill field with animation
        UIView.animate(withDuration: 2.0, animations: {
            self.tip2Field.center.y += self.view.bounds.width
        })
        
        //Achieving Fade-in animation with alpha
        UIView.animate(withDuration: 1.0, delay: 1.0,
                       options: [],
                       animations: {
                        self.tip2Field.alpha = 1.0
        }, completion: nil)
        
        //Achieving Fade-in animation with alpha
        UIView.animate(withDuration: 1.0, delay: 1.0,
                       options: [],
                       animations: {
                        self.tip3Field.alpha = 1.0
        }, completion: nil)
        
        //Bringing back the bill field with animation
        UIView.animate(withDuration: 2.0, animations: {
            self.tip3Field.center.y += self.view.bounds.width
        })
        
        //Achieving Fade-in animation with alpha
        UIView.animate(withDuration: 1.0, delay: 1.0,
                       options: [],
                       animations: {
                        self.tip3Field.alpha = 1.0
        }, completion: nil)
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if (delegate != nil){
        let tip1=Int(tip1Field.text!)
        let tip2=Int(tip2Field.text!)
        let tip3=Int(tip3Field.text!)
            
            defaults.set(tip1, forKey:"tip1")
            defaults.set(tip2, forKey:"tip2")
            defaults.set(tip3, forKey:"tip3")

        delegate?.userDidEnterInformation(data1:tip1,data2:tip2,data3:tip3)
            
        let message = NSLocalizedString("Tip Parameters saved in Succesfully", comment : "Tip Parameters saved in Succesfully")
            self.showSuccessMessage(message)
            
        
        }
        else
            {
             let message = NSLocalizedString("Tip Parameters has not been saved.", comment : "Tip Parameters has not been saved.")
            showErrorMessage(message)   
            }
        }
    
    /**
     This method show an iOS styled Alert View for failed actions
     - parameters:
     - message: The message to be displayed in the alert view
     */
    func showErrorMessage(_ message: String) {
        dismissProgress()
        let title = NSLocalizedString("Error", comment : "Error")
        let action = NSLocalizedString("Ok", comment : "Ok")
        
        // Warn the user
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertMessage.addAction(UIAlertAction(title: action, style: .default, handler: nil))
        
        present(alertMessage, animated: true, completion: nil)
    }
    
    /**
     This method show an iOS styled Alert View for successful actions
     - parameters:
     - message: The message to be displayed in the alert view
     */
    func showSuccessMessage(_ message: String) {
        
        let title = NSLocalizedString("Success", comment : "Success")
        let action = NSLocalizedString("Ok", comment : "Ok")
        
        // Warn the user
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertMessage.addAction(UIAlertAction(title: action, style: .default, handler: nil))
        
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    /**
     This method show an iOS styled Alert View for successful actions with action handler
     - parameters:
     - message: The message to be displayed in the alert view
     - callback: The function to be called by the handler
     */
    func showSuccessMessage(_ message: String, callback: @escaping () -> Void) {
        
        let title = NSLocalizedString("Success", comment : "Success")
        let action = NSLocalizedString("Ok", comment : "Ok")
        
        // Warn the user
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: action, style: .default) { (action) in
            DispatchQueue.main.async(execute: {
                callback()
            })
        }
        
        alertMessage.addAction(confirmAction)
        
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    func dismissProgress() {
        self.navigationController?.popViewController(animated: true);
    }
    
    }

protocol DataEnteredDelegate {
    func userDidEnterInformation(data1: Int!,data2: Int!,data3: Int!)
}

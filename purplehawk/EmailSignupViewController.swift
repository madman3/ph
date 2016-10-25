//
//  EmailSignupViewController.swift
//  purplehawk
//
//  Created by Sunil Tej on 25/10/16.
//  Copyright © 2016 Purplehawk. All rights reserved.
//

import UIKit
import Firebase

class EmailSignupViewController: UIViewController {

    @IBOutlet weak var email_enter: UITextField!
    @IBOutlet weak var pass_enter: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func CreateAccountBtn(sender: AnyObject) {
        
        FIRAuth.auth()?.createUserWithEmail(email_enter.text!, password: pass_enter.text!, completion: { user, error in
            
            if error != nil{
                
                self.login()
            }
            else{
                
                print("User has been created")
                self.login()
            }
            
            
        })
        
    }
    
    func login(){
        
        FIRAuth.auth()?.signInWithEmail(email_enter.text!, password: pass_enter.text!, completion: {
            user, error in
            
            if error != nil {
                
                print("invalid")
            }
            else{
                
                print("We made it!")
            }
            
            
        })
        
        
    }


}

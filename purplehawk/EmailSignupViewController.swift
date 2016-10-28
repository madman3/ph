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
    @IBOutlet weak var signup_status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func CreateAccountBtn(_ sender: AnyObject) {
        
        FIRAuth.auth()?.createUser(withEmail: email_enter.text!, password: pass_enter.text!, completion: { user, error in
            
            if error != nil{
                
                self.login()
                self.signup_status.text = "Someone fucked up my signup"
            }
            else{
                
                print("User has been created")
                self.login()
                self.signup_status.text = "My bro has been created successfully"
            }
            
            
        })
        
    }
    
    func login(){
        
        FIRAuth.auth()?.signIn(withEmail: email_enter.text!, password: pass_enter.text!, completion: {
            user, error in
            
            if error != nil {
                
                print("invalid")
                self.signup_status.text = "Someone fucked up my login"
            }
            else{
                
                print("We made it!")
                self.signup_status.text = "Logged in yo bitch!"
            }
            
            
        })
        
        
    }


}

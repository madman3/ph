//
//  SignupBtnsViewController.swift
//  purplehawk
//
//  Created by Sunil Tej on 25/10/16.
//  Copyright © 2016 Purplehawk. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase


class SignupBtnsViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    //Initialising the fb button
    let fbLoginBtn = FBSDKLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.fbLoginBtn.isHidden = true
        
        //checking if the user is already signed in
        if FIRAuth.auth()?.currentUser != nil {
            // User is signed in.
            // direct the user to the homescreen
            
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let HomeViewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeView")
            
            self.present(HomeViewController, animated: true, completion: nil)
            
        } else {
            // No user is signed in.
            // show the user the login button
            
            //Adding the fb button
            fbLoginBtn.readPermissions = ["public_profile", "email", "user_friends"]
            view.addSubview(fbLoginBtn)
            fbLoginBtn.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
            fbLoginBtn.delegate = self
            
            self.fbLoginBtn.isHidden = false
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        try! FIRAuth.auth()!.signOut()
        
        FBSDKAccessToken.setCurrent(nil)
        
        print("Did log out of facebook")
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "SignupIllustration")
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        print("User clicked on login")
        
        self.fbLoginBtn.isHidden = true
        
        if error != nil {
            print(error)
            self.fbLoginBtn.isHidden = false
            return
        }
        else if(result.isCancelled)
        {
            //handle the cancel event on fb page
            self.fbLoginBtn.isHidden = false
        }
        else{
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
            }
        }
        print("We got into facebook and firebase bro")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  HomeViewController.swift
//  purplehawk
//
//  Created by Sunil Tej on 30/01/17.
//  Copyright © 2017 Purplehawk. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    
    @IBAction func didTapLogout(_ sender: UIButton) {
        
        //sign the user out of the firebase app
        try! FIRAuth.auth()!.signOut()
        
        //sign the user out of facebook app
        FBSDKAccessToken.setCurrent(nil)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "SignupIllustration")
        
        self.present(viewController, animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

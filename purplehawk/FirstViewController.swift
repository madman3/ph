//
//  FirstViewController.swift
//  purplehawk
//
//  Created by Sunil on 03/08/16.
//  Copyright © 2016 Purplehawk. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var phlogo: UIImageView!
    @IBOutlet weak var bgph: UIImageView!
    @IBOutlet weak var signupbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotosmbtn(sender: AnyObject) {
        phlogo.hidden = false
        bgph.hidden = false
        signupbtn.hidden = true
    }
    
    //Just trying to test git

}


//
//  ViewController.swift
//  halfsies
//
//  Created by Maxmillion McLaughlin on 9/24/16.
//  Copyright © 2016 Halfsies. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var nicknameField: UITextField!
    
    @IBAction func changedNickname(sender: UIButton) {
        let nickname: String = nicknameField.text!
        
        let defaults = UserDefaults.standard
        defaults.setValue(nickname, forKey: "nickname")
        
        print("did update nickname for user to " + nickname)
        print("please restart")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        if let nickname = defaults.string(forKey: "nickname") {
            nicknameField.text = nickname
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


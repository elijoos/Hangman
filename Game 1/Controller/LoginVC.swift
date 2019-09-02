//
//  LoginVC.swift
//  Game 1
//
//  Created by COMPUTER on 2/12/18.
//  Copyright © 2018 COMPUTER. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginVC: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
   
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let googlesinginbutton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        googlesinginbutton.center = view.center
        view.addSubview(googlesinginbutton)
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.receiveToggleAuthUINotification(_:)),
            name: NSNotification.Name(rawValue: "ToggleAuthUINotification"), object: nil)
        
       // statusText.text = "Initialized Swift app..."
        toggleAuthUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleAuthUI() {
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            // Signed in
            signInButton.isHidden = true
           // signOutButton.isHidden = false
            //disconnectButton.isHidden = false
        } else {
            signInButton.isHidden = false
            //signOutButton.isHidden = true
            //disconnectButton.isHidden = true
            //statusText.text = "Google Sign in\niOS Demo"
        }
    }
    // [END toggle_auth]
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                                  object: nil)
    }
    
    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
        if notification.name.rawValue == "ToggleAuthUINotification" {
            self.toggleAuthUI()
            if notification.userInfo != nil {
                guard let userInfo = notification.userInfo as? [String:String] else { return }
                //self.statusText.text = userInfo["statusText"]!
            }
        }
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

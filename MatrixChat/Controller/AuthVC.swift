//
//  AuthVC.swift
//  MatrixChat
//
//  Created by Stefan Markovic on 8/16/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    //when clicked on sign in with email it will present the AuthVC
    @IBAction func signInWithEmail(_ sender: UIButton) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func signInWithGoogle(_ sender: UIButton) {
        
    }
    
    @IBAction func signInWithFacebook(_ sender: UIButton) {
        
    }
    
    

}

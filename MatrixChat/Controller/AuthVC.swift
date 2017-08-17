//
//  AuthVC.swift
//  MatrixChat
//
//  Created by Stefan Markovic on 8/16/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

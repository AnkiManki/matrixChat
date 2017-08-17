//
//  AuthService.swift
//  MatrixChat
//
//  Created by Stefan Markovic on 8/17/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }

            //Passing user data to our firebase DB
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
        
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
        
    }
    
    
}

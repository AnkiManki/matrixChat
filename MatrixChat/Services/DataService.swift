//
//  DataService.swift
//  MatrixChat
//
//  Created by Stefan Markovic on 8/16/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//
// This file will manage our database in firebase

import Foundation
import Firebase

//base url to access our database
let DB_BASE = Database.database().reference()

class DataService {
    //this is a singleton class, thats why its static
    static let instance = DataService()
    //var to hold the value of the db base
    private var _REF_BASE = DB_BASE
    //var to hold the reference of the users, if it doesnt exist it will create it. folder for our users
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groupse")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    //this function will create new user in our DB
    func createDBUser(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    
    
}

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
    
    func getUsername(forUID uid: String, handler: @escaping (_ username: String)->()){
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    //this function will upload posto to firebase
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupkey: String?, sendComplete: @escaping (_ status: Bool) -> ()){
        if groupkey != nil {
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
    }

    //it will get all messages from the firebase DB
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        var messageArray = [Message]()
        
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else {return}
            
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderId: senderId)
                messageArray.append(message)
            }
            
            handler(messageArray)
        }
    }
    
    
    
    
    
    
}

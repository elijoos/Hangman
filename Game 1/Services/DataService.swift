//
//  DataService.swift
//  Game 1
//
//  Created by COMPUTER on 2/11/18.
//  Copyright © 2018 COMPUTER. All rights reserved.
//

import Foundation
import Firebase
import SwiftKeychainWrapper
import FirebaseDatabase

let DB_BASE = Database.database().reference()

class DataService {
    
    static let ds = DataService()
}

private var _REF_BASE = DB_BASE
private var _REF_USERS = DB_BASE.child("users")

var REF_BASE: DatabaseReference {
    return _REF_BASE
}

var REF_USERS: DatabaseReference {
    return _REF_USERS
}

var REF_USER_CURRENT: DatabaseReference {
    let uid = KeychainWrapper.standard.string(forKey: "uid")
    let user = REF_USERS.child(uid!)
    
    return user
}

func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
    REF_USERS.child(uid).updateChildValues(userData)
    //if a new user, firebase will create it, otherwise it will just add onto the existing user
}

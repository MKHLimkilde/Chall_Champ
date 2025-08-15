//
//  AuthManager.swift
//  Chall Champ
//
//  Created by Marcus Hauen-Limkilde on 6/12/23.
//
import FirebaseAuth
import Foundation


public class AuthManager{
    
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         - Check if Username is available
         - Check if email is available

         */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) {canCreate in
            if canCreate {
                /*
                //Create Account
                //Insert Account to DataBase
                */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else{
                        // Firebase Auth could not create Account
                        completion(false)
                        return
                        
                    }
                    // Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            // Insert to database
                            completion(true)
                            return
                        }
                        else {
                            // Failed to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                // Either Username or Email Does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // Email Login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username {
            // Username Login
            
        } else {
            completion(false)
        }
    }
    /// Attempt to log out FIreBase User
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch {
            print(error)
            completion(false)
            return
        }
    }

}

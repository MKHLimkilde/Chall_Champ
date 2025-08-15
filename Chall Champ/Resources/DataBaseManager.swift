//
//  DataBaseManager.swift
//  Chall Champ
//
//  Created by Marcus Hauen-Limkilde on 6/12/23.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager{
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
    // MARK: - Public
    
    
    /// Check if username and email is available
    ///- Parameters
    ///     - Email: String representing Email
    ///     - Email: String representing Username

    public func canCreateNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    /// Insert new users data to database
    ///- Parameters
    ///     - Email: String representing Email
    ///     - Email: String representing Username
    ///     - Completion: Async callback for result if database entry succeeded
    public func  insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["Username": username]) { error,_ in
            if error == nil {
                // Succeeded
                completion(true)
                return
            }
            else {
                // Failed
                completion(false)
                return
            }
        }
    }
    
    
    
}

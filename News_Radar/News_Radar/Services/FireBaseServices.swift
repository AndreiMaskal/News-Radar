//
//  FireBaseServices.swift
//  News_Radar
//
//  Created by Andrei Maskal on 08/11/2022.
//

import Foundation
import Firebase

class FireBaseServices {

    static let shared = FireBaseServices()
    
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            completion(.success(true))
        }
    }
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error == nil {
                if let result = result {
                    print(result.user.uid)
                    let base = Database.database().reference().child("users")
                    base.child(result.user.uid).updateChildValues(["email": email])
                }
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}

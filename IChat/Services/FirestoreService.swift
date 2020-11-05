//
//  FirestoreService.swift
//  IChat
//
//  Created by Антон Калинин on 05.11.2020.
//

import Firebase

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarImageString: String?, description: String?, sex: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
        let mUser = MUser(username: username!, email: email, avatarStringURL: "not exist", description: description!, sex: sex!, id: id)
        
        self.usersRef.document(mUser.id).setData(mUser.representation) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(mUser))
            }
        }
    }
    
}


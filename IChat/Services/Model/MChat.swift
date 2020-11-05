//
//  MChat.swift
//  IChat
//
//  Created by Антон Калинин on 27.10.2020.
//

import Foundation
import FirebaseFirestore.FIRQuerySnapshot

struct MChat: Hashable, Decodable {
    var friendUsername: String
    var friendAvatarStringURL: String
    var lastMessage: String
    var friendId: String
    
    var representation: [String: Any] {
        var rep = ["friendUsername": friendUsername]
        rep["friendAvatarStringURL"] = friendAvatarStringURL
        rep["lastMessage"] = lastMessage
        rep["friendId"] = friendId
        return rep
    }
    
    init(friendUsername: String, friendAvatarStringURL: String, lastMessage: String, friendId: String) {
        self.friendUsername = friendUsername
        self.friendAvatarStringURL = friendAvatarStringURL
        self.lastMessage = lastMessage
        self.friendId = friendId
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        
        guard
            let friendUsername = data["friendUsername"] as? String,
            let friendAvatarStringURL = data["friendAvatarStringURL"] as? String,
            let lastMessage = data["lastMessage"] as? String,
            let friendId = data["friendId"] as? String
        else {
            return nil
        }
        
        self.friendUsername = friendUsername
        self.friendAvatarStringURL = friendAvatarStringURL
        self.lastMessage = lastMessage
        self.friendId = friendId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
}

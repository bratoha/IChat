//
//  MMessage.swift
//  IChat
//
//  Created by Антон Калинин on 05.11.2020.
//

import UIKit

struct MMessage: Hashable {
    let content: String
    let senderId: String
    let senderUsername: String
    var sendDate: Date
    let id: String?
    
    init(user: MUser, content: String) {
        self.senderId = user.id
        self.senderUsername = user.username
        self.sendDate = Date()
        self.content = content
        self.id = nil
    }
    
    var representation: [String: Any] {
        let rep: [String: Any] = [
            "created": sendDate,
            "senderID": senderId,
            "senderName": senderUsername,
            "content": content,
        ]
        
        return rep
    }
}

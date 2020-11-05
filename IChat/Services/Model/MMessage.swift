//
//  MMessage.swift
//  IChat
//
//  Created by Антон Калинин on 05.11.2020.
//

import UIKit
import FirebaseFirestore.FIRQuerySnapshot

struct MMessage: Hashable {
    let content: String
    let senderId: String
    let senderName: String
    var sendDate: Date
    let id: String?
    
    init(user: MUser, content: String) {
        self.senderId = user.id
        self.senderName = user.username
        self.sendDate = Date()
        self.content = content
        self.id = nil
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        
        guard let sendDate = data["created"] as? Timestamp,
              let senderId = data["senderID"] as? String,
              let senderName = data["senderName"] as? String,
              let content = data["content"] as? String else {
            return nil
        }
        
        self.id = document.documentID
        self.sendDate = sendDate.dateValue()
        self.senderId = senderId
        self.senderName = senderName
        self.content = content
    }
    
    var representation: [String: Any] {
        let rep: [String: Any] = [
            "created": sendDate,
            "senderID": senderId,
            "senderName": senderName,
            "content": content,
        ]
        
        return rep
    }
}

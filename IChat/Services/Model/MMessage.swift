//
//  MMessage.swift
//  IChat
//
//  Created by Антон Калинин on 05.11.2020.
//

import UIKit
import FirebaseFirestore.FIRQuerySnapshot
import MessageKit

struct MMessage: Hashable {
    
    let content: String
    var sender: SenderType
    var sendDate: Date
    let id: String?
    
    init(user: MUser, content: String) {
        self.sender = user
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
        self.sender = Sender(senderId: senderId, displayName: senderName)
        self.content = content
    }
    
    var representation: [String: Any] {
        let rep: [String: Any] = [
            "created": sendDate,
            "senderID": sender.senderId,
            "senderName": sender.displayName,
            "content": content,
        ]
        
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(messageId)
    }
}

extension MMessage: MessageType {
    
    var messageId: String {
        return self.id ?? UUID().uuidString
    }
    
    var sentDate: Date {
        sendDate
    }
    
    var kind: MessageKind {
        .text(content)
    }
    
    static func == (lhs: MMessage, rhs: MMessage) -> Bool {
        return lhs.messageId == rhs.messageId
    }
}

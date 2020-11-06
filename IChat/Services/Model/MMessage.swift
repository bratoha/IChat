//
//  MMessage.swift
//  IChat
//
//  Created by Антон Калинин on 05.11.2020.
//

import UIKit
import FirebaseFirestore.FIRQuerySnapshot
import MessageKit

struct ImageItem: MediaItem {
    var url: URL?
    var image: UIImage?
    var placeholderImage: UIImage
    var size: CGSize
}

struct MMessage: Hashable {
    
    let content: String
    var sender: SenderType
    var sendDate: Date
    let id: String?
    
    var image: UIImage? = nil
    var downloadURL: URL? = nil
    
    private struct Sender: SenderType {
        var senderId: String
        var displayName: String
    }
    
    init(user: MUser, content: String) {
        self.sender = user
        self.sendDate = Date()
        self.content = content
        self.id = nil
    }
    
    init(user: MUser, image: UIImage) {
        self.sender = user
        self.image = image
        self.content = ""
        self.sendDate = Date()
        self.id = nil
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        
        guard let sendDate = data["created"] as? Timestamp,
              let senderId = data["senderID"] as? String,
              let senderName = data["senderName"] as? String
        else {
            return nil
        }
        
        self.id = document.documentID
        self.sendDate = sendDate.dateValue()
        self.sender = Sender(senderId: senderId, displayName: senderName)
        
        if let content = data["content"] as? String {
            self.content = content
            self.downloadURL = nil
        } else if let urlString = data["url"] as? String, let url = URL(string: urlString) {
            self.downloadURL = url
            self.content = ""
        } else {
            return nil
        }
    }
    
    var representation: [String: Any] {
        var rep: [String: Any] = [
            "created": sendDate,
            "senderID": sender.senderId,
            "senderName": sender.displayName,
        ]
        
        if let url = downloadURL {
            rep["url"] = url.absoluteString
        } else {
            rep["content"] = content
        }
        
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(messageId)
    }
}

//MARK: MessageType
extension MMessage: MessageType {
    
    var messageId: String {
        return self.id ?? UUID().uuidString
    }
    
    var sentDate: Date {
        return sendDate
    }
    
    var kind: MessageKind {
        return image != nil ?
            .photo(ImageItem(
                    url: nil,
                    image: nil,
                    placeholderImage: image!,
                    size: image!.size)) :
            .text(content)
    }
    
    static func == (lhs: MMessage, rhs: MMessage) -> Bool {
        return lhs.messageId == rhs.messageId
    }
}

// MARK: Comparable
extension MMessage: Comparable {
    static func < (lhs: MMessage, rhs: MMessage) -> Bool {
        lhs.sendDate < rhs.sendDate
    }
}

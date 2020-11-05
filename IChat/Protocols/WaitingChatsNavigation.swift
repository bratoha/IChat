//
//  WaitingChatsNavigation.swift
//  IChat
//
//  Created by Антон Калинин on 05.11.2020.
//

import Foundation

protocol WaitingChatsNavigation: class {
    func removeWaitingChat(chat: MChat)
    func changeToActive(chat: MChat)
}

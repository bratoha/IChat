//
//  AuthNavigationDelegate.swift
//  IChat
//
//  Created by Антон Калинин on 03.11.2020.
//

import Foundation

protocol AuthNavigationDelegate: class {
    func toLoginViewController()
    func toSignUpViewController()
}

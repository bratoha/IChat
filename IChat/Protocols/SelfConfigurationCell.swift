//
//  SelfConfigurationCell.swift
//  IChat
//
//  Created by Антон Калинин on 27.10.2020.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with value: MChat)
}

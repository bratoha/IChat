//
//  SetupProfileViewController.swift
//  IChat
//
//  Created by Антон Калинин on 07.10.2020.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let fillImageView = AddPhotoView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        setupConstraints()
    }

}

// MARK: Setup constraints
extension SetupProfileViewController {
    private func setupConstraints() {
        fillImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fillImageView)
        
        NSLayoutConstraint.activate([
            fillImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 160),
            fillImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 23)
        ])
    }
}

import SwiftUI

struct SetupViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SetupProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}

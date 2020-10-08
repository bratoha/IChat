//
//  SetupProfileViewController.swift
//  IChat
//
//  Created by Антон Калинин on 07.10.2020.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Set up  profile!", font: .avenir26())
    
    let fullNameLabel = UILabel(text: "Full name")
    let aboutMeLabel = UILabel(text: "About me")
    let sexLabel = UILabel(text: "Sex")
    
    let fullNameTextField = OneLineTextField(font: .avenir20())
    let aboutMeTextField = OneLineTextField(font: .avenir20())
    
    let sexSegmentdControl = UISegmentedControl(first: "Male", second: "Female")
    
    let goToChatsButton = UIButton(title: "Go to chats!", titleColor: .white, backgroundColor: .buttonDark())
    
    let fillImageView = AddPhotoView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupConstraints()
    }

}

// MARK: Setup constraints
extension SetupProfileViewController {
    private func setupConstraints() {
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField],
                                            axis: .vertical,
                                            spacing: 0)
        
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField],
                                           axis: .vertical,
                                           spacing: 0)
        
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentdControl],
                                       axis: .vertical,
                                       spacing: 12)
        
        let stackView = UIStackView(arrangedSubviews: [
            fullNameStackView,
            aboutMeStackView,
            sexStackView,
            goToChatsButton
        ],
        axis: .vertical,
        spacing: 40)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        fillImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(fillImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fillImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            fillImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 23)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: fillImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40)
        ])
        
        goToChatsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
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

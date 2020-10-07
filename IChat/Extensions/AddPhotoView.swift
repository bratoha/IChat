//
//  AddPhotoView.swift
//  IChat
//
//  Created by Антон Калинин on 07.10.2020.
//

import UIKit

class AddPhotoView: UIView {
    
    var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let plusImage = #imageLiteral(resourceName: "plus")
        button.setImage(plusImage, for: .normal)
        button.tintColor = .buttonDark()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(circleImageView)
        addSubview(plusButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: self.topAnchor),
            circleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            circleImageView.widthAnchor.constraint(equalToConstant: 100),
            circleImageView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        self.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: plusButton.trailingAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.bounds.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

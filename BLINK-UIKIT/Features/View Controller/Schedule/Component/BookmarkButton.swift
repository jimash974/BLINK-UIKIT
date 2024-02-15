//
//  BookmarkButton.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 13/02/24.
//

import UIKit

class BookmarkButton: UIButton {
    let buttonImage = UIImageView()
    let buttonText = UILabel()

    init(image: UIImage, text:String) {
        super.init(frame: .zero)
        buttonImage.image = image
        buttonText.text = text
        
        setUpButton()
    }
    
    func setUpButton(){
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 10
        buttonImage.contentMode = .scaleAspectFit
        buttonImage.tintColor = .black
        
        buttonText.textAlignment = .center
        
        buttonText.translatesAutoresizingMaskIntoConstraints = false
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(buttonText)
        self.addSubview(buttonImage)
        
        NSLayoutConstraint.activate([
//            self.widthAnchor.constraint(equaloConstant: 350),
            self.heightAnchor.constraint(equalToConstant: 40),
            buttonText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonText.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            buttonImage.trailingAnchor.constraint(equalTo: buttonText.leadingAnchor, constant: -5),
            buttonImage.centerYAnchor.constraint(equalTo: buttonText.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

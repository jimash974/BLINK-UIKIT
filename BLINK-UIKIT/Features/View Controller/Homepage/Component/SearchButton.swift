//
//  buttonTest.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 06/02/24.
//

import Foundation
import UIKit

class SearchButton: UIButton {
    // Set up the button with image and text side by side
    func setupButton(image: UIImage?, text: String) {
        // Create an imageView for the image
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black

        // Create a label for the text
        let label = UILabel()
        label.text = text
        label.textAlignment = .center

        // Add image and label as subviews to the button
        addSubview(imageView)
        addSubview(label)

        // Set up constraints for image and label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Label constraints
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            
            // Image constraints
            imageView.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -8),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
//            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),


        ])
    }
    override var isHighlighted: Bool {
        didSet {
            guard isEnabled else {
                // If the button is disabled, prevent highlighting feedback
                return
            }
            backgroundColor = isHighlighted ? .darkGray : UIColor(red: 255/255, green: 131/255, blue: 37/255, alpha: 1)
        }
    }
}



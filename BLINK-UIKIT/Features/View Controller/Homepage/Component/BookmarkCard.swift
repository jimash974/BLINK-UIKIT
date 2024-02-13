//
//  BookmarkCard.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 08/02/24.
//

import UIKit

class BookmarkCard: UIView {
    let container : UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let busImage: UIImageView = {
       let busImg = UIImageView(image: UIImage(systemName: "bus"))
        busImg.tintColor = .black
        busImg.translatesAutoresizingMaskIntoConstraints = false
        return busImg
    }()
    
    let hourText: UILabel = {
       let hourText = UILabel()
        hourText.text = "15:00"
        hourText.textColor = .black
        hourText.font = .systemFont(ofSize: 17, weight: .semibold)
        hourText.translatesAutoresizingMaskIntoConstraints = false
        return hourText
    }()
    
    let lineLogo: UIImageView = {
        let lineLogo = UIImageView(image: UIImage(named: "lineBookmrk"))
        lineLogo.translatesAutoresizingMaskIntoConstraints = false
        return lineLogo
    }()
    
    let startText: UILabel = {
       let startText = UILabel()
        startText.text = "Eternity"
        startText.textColor = .black
        startText.font = .systemFont(ofSize: 17, weight: .regular)
        startText.translatesAutoresizingMaskIntoConstraints = false
        return startText
    }()
    
    let destText: UILabel = {
       let destText = UILabel()
        destText.text = "Puspita Loka"
        destText.textColor = .black
        destText.font = .systemFont(ofSize: 17, weight: .regular)
        destText.translatesAutoresizingMaskIntoConstraints = false
        return destText
    }()
    
    func setUpCard(){
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(container)
        self.addSubview(busImage)
        self.addSubview(hourText)
        self.addSubview(lineLogo)
        self.addSubview(startText)
        self.addSubview(destText)
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 264),
            self.heightAnchor.constraint(equalToConstant: 95),
            
            busImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 13),
            busImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
            busImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -218),
            busImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -41.17),
            
            hourText.centerXAnchor.constraint(equalTo: busImage.centerXAnchor),
            hourText.topAnchor.constraint(equalTo: busImage.bottomAnchor, constant: 5.83),
            
            lineLogo.leadingAnchor.constraint(equalTo: busImage.trailingAnchor, constant: 13),
            lineLogo.topAnchor.constraint(equalTo: self.topAnchor, constant: 25.83),
            lineLogo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -22.61),
            
            startText.leadingAnchor.constraint(equalTo: lineLogo.trailingAnchor, constant: 4),
            startText.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            destText.leadingAnchor.constraint(equalTo: startText.leadingAnchor),
            destText.topAnchor.constraint(equalTo: startText.bottomAnchor, constant: 14.72)
        ])
    }
}

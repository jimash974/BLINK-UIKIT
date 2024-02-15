//
//  BusScheduleCard.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 13/02/24.
//

import UIKit

class BusScheduleCard: UIView {
    let timeText = UILabel()
    let nameText = UILabel()
    var bckColor = UIColor()
    let routeText = UILabel()

    init(time: String, name: String, color: UIColor,route: String){
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        
        timeText.text = time
        nameText.text = name
        bckColor = color
        routeText.text = route
        
        setUpCard()
    }
    
    func setUpCard(){
        let busImage  = UIImageView(image: UIImage(systemName: "bus"))
        busImage.tintColor = .black
        busImage.translatesAutoresizingMaskIntoConstraints = false
        
        timeText.font = .systemFont(ofSize: 17,weight: .semibold)
        timeText.translatesAutoresizingMaskIntoConstraints = false
        
        let routeBackground = UIView()
        routeBackground.backgroundColor = bckColor
        routeBackground.layer.cornerRadius = 20
        routeBackground.translatesAutoresizingMaskIntoConstraints = false
        
        nameText.font = .systemFont(ofSize: 17, weight: .semibold)
        nameText.translatesAutoresizingMaskIntoConstraints = false
        
        routeText.font = .systemFont(ofSize: 17, weight: .regular)
        routeText.numberOfLines = 0
        routeText.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(busImage)
        self.addSubview(timeText)
        self.addSubview(routeBackground)
        self.addSubview(nameText)
        self.addSubview(routeText)
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 350),
//            self.heightAnchor.constraint(equalToConstant: 100),
            
            busImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 11),
            busImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
            busImage.widthAnchor.constraint(equalToConstant: 30),
            busImage.heightAnchor.constraint(equalToConstant: 30),
            
            timeText.centerXAnchor.constraint(equalTo: busImage.centerXAnchor),
            timeText.topAnchor.constraint(equalTo: busImage.bottomAnchor, constant: 8.69),
            
            routeBackground.heightAnchor.constraint(equalToConstant: 32),
            routeBackground.widthAnchor.constraint(equalToConstant: 250),
            routeBackground.leadingAnchor.constraint(equalTo: busImage.trailingAnchor, constant: 22),
//            routeBackground.leadingAnchor.constraint(equalTo: busImage.trailingAnchor, constant: 22),
//            routeBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -31),
            routeBackground.topAnchor.constraint(equalTo: busImage.topAnchor),
            
            nameText.centerXAnchor.constraint(equalTo: routeBackground.centerXAnchor),
            nameText.centerYAnchor.constraint(equalTo: routeBackground.centerYAnchor),
            
            routeText.topAnchor.constraint(equalTo: routeBackground.bottomAnchor, constant: 9),
            routeText.leadingAnchor.constraint(equalTo: routeBackground.leadingAnchor),
            routeText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            routeText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

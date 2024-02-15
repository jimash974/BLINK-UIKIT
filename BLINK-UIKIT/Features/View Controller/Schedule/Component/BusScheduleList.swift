//
//  BusScheduleList.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 14/02/24.
//

import UIKit

class BusScheduleList: UIScrollView {
    
    func setUpList(){
        let busScheduleCard = BusScheduleCard(time: "12:57", name: "BSD Link Sektor 1.3", color: UIColor(red: 255/255, green: 154/255, blue: 172/255, alpha: 1), route: "Terminal Intermoda - Sektor 1.3 - Terminal Intermoda")
        busScheduleCard.translatesAutoresizingMaskIntoConstraints = false
        
        let busScheduleCard2 = BusScheduleCard(time: "13:06", name: "BSD Link De Park 1", color: UIColor(red: 65/255, green: 204/255, blue: 246/255, alpha: 1), route: "Terminal Intermoda - De Park - Terminal Intermoda(Rute 1)")
        busScheduleCard2.translatesAutoresizingMaskIntoConstraints = false
        
        let busScheduleCard3 = BusScheduleCard(time: "13:15", name: "BSD Link De Park 2", color: UIColor(red: 231/255, green: 153/255, blue: 255/255, alpha: 1), route: "Terminal Intermoda - De Park - Terminal Intermoda(Rute 2)")
        busScheduleCard3.translatesAutoresizingMaskIntoConstraints = false
        
        let busScheduleCard4 = BusScheduleCard(time: "13:23", name: "BSD Link Electric Vehicle", color: UIColor(red: 255/255, green: 190/255, blue: 112/255, alpha: 1), route: "Terminal Intermoda - ICE - QBIG - Ara Rasa - The Breeze - Digital Hub")
        busScheduleCard4.translatesAutoresizingMaskIntoConstraints = false
        
        let busScheduleCard5 = BusScheduleCard(time: "13:23", name: "BSD Link Electric Vehicle", color: UIColor(red: 255/255, green: 190/255, blue: 112/255, alpha: 1), route: "Terminal Intermoda - ICE - QBIG - Ara Rasa - The Breeze - Digital Hub")
        busScheduleCard5.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(busScheduleCard)
        self.addSubview(busScheduleCard2)
        self.addSubview(busScheduleCard3)
        self.addSubview(busScheduleCard4)
        self.addSubview(busScheduleCard5)
        
        
        NSLayoutConstraint.activate([
            
            busScheduleCard.topAnchor.constraint(equalTo: self.topAnchor),
            busScheduleCard.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            busScheduleCard.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            
            busScheduleCard2.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard2.topAnchor.constraint(equalTo: busScheduleCard.bottomAnchor, constant: 15),
            
            busScheduleCard3.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard3.topAnchor.constraint(equalTo: busScheduleCard2.bottomAnchor, constant: 15),
            
            busScheduleCard4.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard4.topAnchor.constraint(equalTo: busScheduleCard3.bottomAnchor, constant: 15),
            
            busScheduleCard5.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard5.topAnchor.constraint(equalTo: busScheduleCard4.bottomAnchor, constant: 15),
            
            busScheduleCard5.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }

}

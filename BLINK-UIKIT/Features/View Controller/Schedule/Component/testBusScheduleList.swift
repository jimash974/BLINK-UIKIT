//
//  testBusScheduleList.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 15/02/24.
//

import Foundation
import UIKit

class testBusScheduleList:UIViewController{
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Create a UIScrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
//        setUpCard()
        setUpCardNew()

    }
    
    func setUpCardNew(){
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
        
        let busScheduleCard6 = BusScheduleCard(time: "13:23", name: "BSD Link Electric Vehicle", color: UIColor(red: 255/255, green: 190/255, blue: 112/255, alpha: 1), route: "Terminal Intermoda - ICE - QBIG - Ara Rasa - The Breeze - Digital Hub")
        busScheduleCard6.translatesAutoresizingMaskIntoConstraints = false
        
        let busScheduleCard7 = BusScheduleCard(time: "13:23", name: "BSD Link Electric Vehicle", color: UIColor(red: 255/255, green: 190/255, blue: 112/255, alpha: 1), route: "Terminal Intermoda - ICE - QBIG - Ara Rasa - The Breeze - Digital Hub")
        busScheduleCard7.translatesAutoresizingMaskIntoConstraints = false
        
        let busScheduleCard8 = BusScheduleCard(time: "13:23", name: "BSD Link Electric Vehicle", color: UIColor(red: 255/255, green: 190/255, blue: 112/255, alpha: 1), route: "Terminal Intermoda - ICE - QBIG - Ara Rasa - The Breeze - Digital Hub")
        busScheduleCard8.translatesAutoresizingMaskIntoConstraints = false
        
        let busScheduleCard9 = BusScheduleCard(time: "13:23", name: "BSD Link Electric Vehicle", color: UIColor(red: 255/255, green: 190/255, blue: 112/255, alpha: 1), route: "Terminal Intermoda - ICE - QBIG - Ara Rasa - The Breeze - Digital Hub")
        busScheduleCard9.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(busScheduleCard)
        scrollView.addSubview(busScheduleCard2)
        scrollView.addSubview(busScheduleCard3)
        scrollView.addSubview(busScheduleCard4)
        scrollView.addSubview(busScheduleCard5)
        scrollView.addSubview(busScheduleCard6)
        scrollView.addSubview(busScheduleCard7)
        scrollView.addSubview(busScheduleCard8)
        scrollView.addSubview(busScheduleCard9)
        
        NSLayoutConstraint.activate([
            busScheduleCard.topAnchor.constraint(equalTo: scrollView.topAnchor),
            busScheduleCard.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            busScheduleCard.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            
            busScheduleCard2.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard2.topAnchor.constraint(equalTo: busScheduleCard.bottomAnchor, constant: 15),
            
            busScheduleCard3.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard3.topAnchor.constraint(equalTo: busScheduleCard2.bottomAnchor, constant: 15),
            
            busScheduleCard4.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard4.topAnchor.constraint(equalTo: busScheduleCard3.bottomAnchor, constant: 15),
            
            busScheduleCard5.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard5.topAnchor.constraint(equalTo: busScheduleCard4.bottomAnchor, constant: 15),
            
            busScheduleCard6.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard6.topAnchor.constraint(equalTo: busScheduleCard5.bottomAnchor, constant: 15),
            
            busScheduleCard7.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard7.topAnchor.constraint(equalTo: busScheduleCard6.bottomAnchor, constant: 15),
            
            busScheduleCard8.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard8.topAnchor.constraint(equalTo: busScheduleCard7.bottomAnchor, constant: 15),
            
            busScheduleCard9.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard9.topAnchor.constraint(equalTo: busScheduleCard8.bottomAnchor, constant: 15),
            busScheduleCard9.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
    }

    
    func setUpCard(){
        // Add 10 BusScheduleCard instances to the UIScrollView
        var previousCard: BusScheduleCard?
        for _ in 1...10 {
            let card = BusScheduleCard(time: "12:57", name: "BSD Link Sektor 1.3", color: UIColor(red: 255/255, green: 154/255, blue: 172/255, alpha: 1), route: "Terminal Intermoda - Sektor 1.3 - Terminal Intermoda")
            card.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(card)
            
            NSLayoutConstraint.activate([
                card.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                card.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                card.heightAnchor.constraint(equalToConstant: 150) // Set the desired height for each card
            ])
            
            if let previousCard = previousCard {
                card.topAnchor.constraint(equalTo: previousCard.bottomAnchor, constant: 10).isActive = true
            } else {
                card.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
            }
            
            previousCard = card
        }
        
        // Set the content size of the UIScrollView to allow vertical scrolling
        if let lastCard = previousCard {
            scrollView.bottomAnchor.constraint(equalTo: lastCard.bottomAnchor, constant: 10).isActive = true
        }
    }
}

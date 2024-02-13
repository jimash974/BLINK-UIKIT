//
//  ScheduleVC.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 13/02/24.
//

import Foundation
import UIKit

class ScheduleViewController: UIViewController{
    let backgHeader = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackGround()
        setUpHeader()
        
    }
    
    func setUpBackGround(){
        let backgImage =  UIColor(patternImage: UIImage(named: "BackgroundImage")!)
        view.backgroundColor = backgImage
    }
    
    func setUpHeader(){
        backgHeader.image = UIImage(named: "BackgroundHeader")
        backgHeader.translatesAutoresizingMaskIntoConstraints = false
        
        let backButton = UIImageView(image: UIImage(systemName: "arrow.backward.circle.fill"))
        backButton.tintColor = .black
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        let titlePage = UILabel()
        titlePage.text = "Schedule Recommendations"
        
        
        view.addSubview(backgHeader)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backgHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: -142),
            backgHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}

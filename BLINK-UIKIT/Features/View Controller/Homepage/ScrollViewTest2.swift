//
//  ScrollViewTest2.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 09/02/24.
//

import Foundation
import UIKit

class ScrollViewTest2 : UIViewController{
    let scrollView = UIScrollView()
    let card1 = BookmarkCard()
    let card2 = BookmarkCard()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpScrollView()
        setUpCard()

    }
    
    func setUpScrollView(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
        
        scrollView.layer.borderColor = UIColor.black.cgColor
        scrollView.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 565),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -173.47)
        ])
    }
    
    func setUpCard(){
        let cardWidth: CGFloat = 200 // Set your desired width
        let numberOfCards = 5 // Set the number of cards you want

        for i in 0..<numberOfCards {
            let card = BookmarkCard() // Replace with your actual card component
            card.setUpCard()
            card.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(card)

            NSLayoutConstraint.activate([
//                card.widthAnchor.constraint(equalToConstant: cardWidth),
//                card.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
                card.topAnchor.constraint(equalTo: scrollView.topAnchor),
                card.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(i) * cardWidth),
                card.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])
        }
        
//        scrollView.addSubview(card1)
//        scrollView.addSubview(card2)
//
//        card1.setUpCard()
//        card2.setUpCard()
//        
//        NSLayoutConstraint.activate([
//            card1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
//            card1.topAnchor.constraint(equalTo: scrollView.topAnchor),
////            card1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//
//            card2.leadingAnchor.constraint(equalTo: card1.trailingAnchor, constant: 30),
//            card2.topAnchor.constraint(equalTo: scrollView.topAnchor),
//        ])
        

        // Set the content size of the UIScrollView to allow horizontal scrolling
        scrollView.contentSize = CGSize(width: CGFloat(5) * 200, height: scrollView.frame.size.height)

    }
}

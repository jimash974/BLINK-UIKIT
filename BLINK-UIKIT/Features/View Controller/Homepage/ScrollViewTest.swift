//
//  ScrollViewTest.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 09/02/24.
//

import Foundation
//
//  ViewController.swift
//  UIScrollView Programmatically
//
//  Created by Andrea Toso on 09/02/2019.
//  Copyright © 2019 Andrea Toso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var scrollView: UIScrollView = {
       let obj = UIScrollView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .darkGray
        return obj
    }()
    
    var scrollContainer: UIView = {
       let obj = UIView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .yellow
        return obj
    }()
    
    var headingLable : UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.numberOfLines = 0
        obj.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse lobortis justo quis iaculis hendrerit. Fusce tincidunt tincidunt ipsum, vitae dapibus diam suscipit tincidunt. Suspendisse tincidunt arcu nec mauris scelerisque, suscipit pellentesque mi aliquam. Quisque tristique, magna eu condimentum maximus, sem arcu sagittis justo, vel aliquet dolor erat nec nisl. Mauris tempus, arcu quis aliquam bibendum, tortor enim feugiat est, a laoreet augue felis quis mauris. Aliquam molestie leo augue, et blandit turpis iaculis quis. Sed pharetra sapien sit amet nisi scelerisque pulvinar. Nunc arcu magna, commodo vitae semper nec, pulvinar ac sem. Phasellus sed consectetur mauris. Integer vestibulum tristique augue ut porttitor. Quisque eget cursus leo. Nunc odio purus, tincidunt ac ante commodo, posuere venenatis libero. Donec consectetur velit sit amet ante vehicula, eu porttitor ex aliquam. Etiam dignissim mauris erat, quis tristique sem fringilla non. Vivamus interdum diam at risus porta lobortis. Proin non ipsum a turpis mollis imperdiet. Donec et tempor magna. Vestibulum sem orci, tristique ut ullamcorper nec, dictum sit amet erat. In nibh augue, suscipit id tincidunt ac, ornare non nunc. Donec semper ullamcorper fermentum. Ut dui lectus, imperdiet quis elementum in, lacinia sed dolor. Fusce viverra, erat vitae auctor mattis, arcu tellus pharetra dui, vel vulputate mauris ex eu turpis. Aliquam vitae laoreet augue. Donec nec pulvinar lorem. Praesent vel diam non neque vestibulum accumsan. Aliquam tincidunt ullamcorper nulla, vitae condimentum neque convallis eget. Duis pellentesque pretium mauris et pharetra. Etiam sed pharetra enim. Morbi tincidunt vitae dolor vitae fringilla. Nam pharetra quis metus ut ultrices. Quisque laoreet felis vulputate, tincidunt ipsum eget, commodo lorem. Fusce ornare aliquam lectus, vel pulvinar urna convallis at. Donec quis urna tellus. Maecenas egestas viverra venenatis. Nulla facilisi. Quisque volutpat varius lobortis. Nam ut nulla ut augue convallis gravida."
        return obj
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainer)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        setUpConstraint()
    }
    
    func setUpConstraint(){
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide
        scrollContainer.addSubview(headingLable)
        
        NSLayoutConstraint.activate([
            scrollContainer.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            scrollContainer.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            
//            for dynamic scrolling
//            scrollContainer.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor),
//            scrollContainer.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor),
//            scrollContainer.heightAnchor.constraint(equalToConstant: 1200),
            
            scrollContainer.topAnchor.constraint(equalTo: scrollFrameGuide.topAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: scrollFrameGuide.bottomAnchor, constant: -300),
            scrollContainer.widthAnchor.constraint(equalToConstant: 800),
            
            headingLable.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor),
            headingLable.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor),
            headingLable.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
//            headingLable.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor)
        ])
    }
    
}



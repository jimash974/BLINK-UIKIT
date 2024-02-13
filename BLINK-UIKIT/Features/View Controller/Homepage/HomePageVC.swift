//
//  ViewController.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 02/02/24.
//

import UIKit

class HomePageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let backgHeader = UIImageView()
    let titlee = UILabel()
    let desc = UILabel()
    let busImage = UIImageView()
    
    let container = UIView()
    let routeContainer = UIView()
    let routeLogo = UIImageView()
    
    let startingInput = UITextField()
    let destInput = UITextField()
    
    let switchButton = UIButton()
    
    let stationPickerView = UIPickerView()
    let stationOptions = ["","ALBERA, CASA DE PARCO", "EXTREME PARK", "GREENWHICH PARK OFFICE", "ICE 1", "QBIG", "SEKTOR1.3", "TERMINAL INTERMODA", "THE BREEZE", "UNIVERSITAS ATMAJAYA", "VANYA PARK"]
    
    var choosedStation = String()
    var inputChoose = String()
    
    let timeContainer = UIView()
    let timeLogo = UIImageView()
    let timeInput = UITextField()
    
    let timePickerView = UIPickerView()
    var hours: [String] {
        return Array(0...24).map { String(format: "%02d", $0) }
    }

    var minutes: [String] {
        return Array(0...59).map { String(format: "%02d", $0) }
     }
    

    let searchButton = SearchButton(type: .system)
    
    let bookmrkTitle = UILabel()
    
    let cardBM1 = BookmarkCard()
    let cardBM2 = BookmarkCard()
    
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpBackGround()
        setUpHeader()
        setUpContainerInput()
        setUpStationInput()
        setUpTimeInput()
        setUpSearchButton()
        setUpBookmarkTitle()
        setUpScrollView()
        setUpBookmarkCard()
        
    }
    
    func setUpBackGround(){
        let backgImage =  UIColor(patternImage: UIImage(named: "BackgroundImage")!)
        view.backgroundColor = backgImage
    }
    
    func setUpHeader(){
        backgHeader.image = UIImage(named: "BackgroundHeader")
        backgHeader.translatesAutoresizingMaskIntoConstraints = false

        titlee.text = "Hi, Cassandra"
        titlee.textColor = .black
        titlee.font = .systemFont(ofSize: 28, weight: .bold)
        titlee.translatesAutoresizingMaskIntoConstraints = false
        
        desc.text = "Find the best BSD Link shcedule and route to reach your destination"
        desc.textColor = .black
        desc.font = .systemFont(ofSize: 15, weight: .regular)
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.numberOfLines = 0
        
        busImage.image = UIImage(named: "BusHeader")
        busImage.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(backgHeader)
        view.addSubview(titlee)
        view.addSubview(desc)
        view.addSubview(busImage)
        
        
        NSLayoutConstraint.activate([
            backgHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titlee.topAnchor.constraint(equalTo: view.topAnchor, constant: 117),
            titlee.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            desc.topAnchor.constraint(equalTo: titlee.bottomAnchor, constant: 10),
            desc.leadingAnchor.constraint(equalTo: titlee.leadingAnchor),
            desc.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -131),
            
            busImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 49),
            busImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 31)
        ])
    }
    
    func setUpContainerInput(){
        container.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 233/255, alpha: 1)
        container.layer.cornerRadius = 10
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: 28),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

    }
    
    func setUpStationInput(){
        
        routeContainer.backgroundColor = .white
        routeContainer.layer.cornerRadius = 10
        routeContainer.translatesAutoresizingMaskIntoConstraints = false
        
        routeLogo.image = UIImage(named: "InputLogo")
        routeLogo.translatesAutoresizingMaskIntoConstraints = false
        
        stationPickerView.delegate = self
        stationPickerView.dataSource = self
        stationPickerView.backgroundColor = .white
        
        startingInput.inputView = stationPickerView
        
        let placeHolderFont = UIFont.systemFont(ofSize: 17, weight: .regular)
        startingInput.attributedPlaceholder = NSAttributedString(
            string: "Set starting bus stop",
            attributes: [NSAttributedString.Key.font: placeHolderFont,
                         NSAttributedString.Key.foregroundColor: UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 0.3)]
        )
        startingInput.translatesAutoresizingMaskIntoConstraints = false
        startingInput.addTarget(self, action: #selector(startingInputTapped), for: .editingDidBegin)
        
        
        
        let horDiv = UIView()
        horDiv.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        horDiv.translatesAutoresizingMaskIntoConstraints = false
        
        
        destInput.attributedPlaceholder = NSAttributedString(
            string: "Set destination bus stop",
            attributes: [NSAttributedString.Key.font: placeHolderFont,
                         NSAttributedString.Key.foregroundColor: UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 0.3)]
        )
        destInput.translatesAutoresizingMaskIntoConstraints = false
        destInput.addTarget(self, action: #selector(destInputTapped), for: .editingDidBegin)
        destInput.inputView = stationPickerView

        
        let buttonImg = UIImage(systemName: "arrow.up.arrow.down")
        switchButton.setImage(buttonImg, for: .normal)
        switchButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.07)
        switchButton.tintColor = .black
        
        let highlightedImage = buttonImg?.withTintColor(UIColor.lightGray, renderingMode: .alwaysOriginal)
        switchButton.setImage(highlightedImage, for: .highlighted)
        
        switchButton.layer.cornerRadius = 10
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        
        switchButton.addTarget(self, action: #selector(switchButtonTapped), for: .touchUpInside)
        
        container.addSubview(routeContainer)
        routeContainer.addSubview(routeLogo)
        routeContainer.addSubview(startingInput)
        routeContainer.addSubview(horDiv)
        routeContainer.addSubview(destInput)
        routeContainer.addSubview(switchButton)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            routeContainer.topAnchor.constraint(equalTo: container.topAnchor, constant: 11),
            routeContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 11),
            routeContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            routeContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -146),
            
            routeLogo.topAnchor.constraint(equalTo: routeContainer.topAnchor, constant: 11),
            routeLogo.leadingAnchor.constraint(equalTo: routeContainer.leadingAnchor, constant: 6),
            routeLogo.bottomAnchor.constraint(equalTo: routeContainer.bottomAnchor, constant: -15),
            
            startingInput.topAnchor.constraint(equalTo: routeContainer.topAnchor, constant: 20),
            startingInput.leadingAnchor.constraint(equalTo: routeLogo.trailingAnchor, constant: 9),
            
            horDiv.heightAnchor.constraint(equalToConstant: 1),
            horDiv.leadingAnchor.constraint(equalTo: startingInput.leadingAnchor),
            horDiv.trailingAnchor.constraint(equalTo: routeContainer.trailingAnchor, constant: -62),
            horDiv.topAnchor.constraint(equalTo: startingInput.bottomAnchor, constant: 15),
            
            destInput.bottomAnchor.constraint(equalTo: routeContainer.bottomAnchor, constant: -19),
            destInput.leadingAnchor.constraint(equalTo: startingInput.leadingAnchor),
            
            switchButton.leadingAnchor.constraint(equalTo: horDiv.trailingAnchor, constant: 14),
            switchButton.topAnchor.constraint(equalTo: routeContainer.topAnchor, constant: 31),
            switchButton.trailingAnchor.constraint(equalTo: routeContainer.trailingAnchor, constant: -8),
            switchButton.bottomAnchor.constraint(equalTo: routeContainer.bottomAnchor, constant: -40)
        ])
    }
    
    func setUpTimeInput(){
        timeContainer.backgroundColor = .white
        timeContainer.layer.cornerRadius = 10
        timeContainer.translatesAutoresizingMaskIntoConstraints = false
        
        timeLogo.image = UIImage(named: "TimeLogo")
        timeLogo.translatesAutoresizingMaskIntoConstraints = false
        
        let placeHolderFont = UIFont.systemFont(ofSize: 17, weight: .regular)
        timeInput.attributedPlaceholder = NSAttributedString(
            string: "Set departure time",
            attributes: [NSAttributedString.Key.font: placeHolderFont,
                         NSAttributedString.Key.foregroundColor: UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 0.3)]
        )
        timeInput.translatesAutoresizingMaskIntoConstraints = false
        timeInput.inputView = timePickerView
        timeInput.addTarget(self, action: #selector(timeInputTapped), for: .editingDidBegin)
        
        timePickerView.delegate = self
        timePickerView.dataSource = self
        timePickerView.backgroundColor = .white
        
        container.addSubview(timeContainer)
        timeContainer.addSubview(timeLogo)
        timeContainer.addSubview(timeInput)
        
        
        NSLayoutConstraint.activate([
            timeContainer.topAnchor.constraint(equalTo: routeContainer.bottomAnchor, constant: 11),
            timeContainer.leadingAnchor.constraint(equalTo: routeContainer.leadingAnchor),
            timeContainer.trailingAnchor.constraint(equalTo: routeContainer.trailingAnchor),
            
            timeLogo.leadingAnchor.constraint(equalTo: timeContainer.leadingAnchor, constant: 8),
            timeLogo.topAnchor.constraint(equalTo: timeContainer.topAnchor, constant: 12),
            timeLogo.bottomAnchor.constraint(equalTo: timeContainer.bottomAnchor, constant: -13),
            
            timeInput.leadingAnchor.constraint(equalTo: timeLogo.trailingAnchor, constant: 12),
            timeInput.topAnchor.constraint(equalTo: timeContainer.topAnchor, constant: 15),
            timeInput.bottomAnchor.constraint(equalTo: timeContainer.bottomAnchor, constant: -15)
        ])
    }
    
    func setUpSearchButton(){
        searchButton.isEnabled = false
        searchButton.setupButton(image: UIImage(systemName: "magnifyingglass"), text: "View Bus Schedule")
        searchButton.backgroundColor = .lightGray
  
        
        searchButton.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        searchButton.layer.cornerRadius = 10
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: timeContainer.bottomAnchor, constant: 20),
            searchButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 11),
            searchButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12)
        ])
    }
    
    func setUpBookmarkTitle(){
        bookmrkTitle.text = "Bookmarked Route"
        bookmrkTitle.textColor = .black
        bookmrkTitle.font = .systemFont(ofSize: 20, weight: .bold)
        
        bookmrkTitle.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bookmrkTitle)
        
        NSLayoutConstraint.activate([
            bookmrkTitle.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 36),
            bookmrkTitle.leadingAnchor.constraint(equalTo: container.leadingAnchor)
        ])
    }
    
    func setUpScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: bookmrkTitle.bottomAnchor, constant: 14),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -173.47)
        ])
        
 

    }
    
    func setUpBookmarkCard(){
        scrollView.addSubview(cardBM1)
        scrollView.addSubview(cardBM2)
        cardBM1.setUpCard()
        cardBM2.setUpCard()
        
        NSLayoutConstraint.activate([
            cardBM1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            cardBM1.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            cardBM2.leadingAnchor.constraint(equalTo: cardBM1.trailingAnchor, constant: 20),
            cardBM2.topAnchor.constraint(equalTo: scrollView.topAnchor),
        ])
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: CGFloat(2) * CGFloat(264), height: scrollView.frame.height)
    }
}


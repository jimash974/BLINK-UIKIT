//
//  ScheduleVC.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 13/02/24.
//

import Foundation
import UIKit

class ScheduleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    
    let backgHeader = UIImageView()
    let container = UIView()
    
    let startingInput = UITextField()
    let destInput = UITextField()
    let timeInput = UITextField()
    
    var bookmrkButton = BookmarkButton(image: UIImage(systemName:"bookmark")!, text: "Route Bookmarked")

    var buttonEnable = false

    let listTitle = UILabel()
    
    let stationPickerView = UIPickerView()
    let stationOptions = ["","ALBERA, CASA DE PARCO", "EXTREME PARK", "GREENWHICH PARK OFFICE", "ICE 1", "QBIG", "SEKTOR1.3", "TERMINAL INTERMODA", "THE BREEZE", "UNIVERSITAS ATMAJAYA", "VANYA PARK"]
    
    let timePickerView = UIPickerView()
    var hours: [String] {
        return Array(0...24).map { String(format: "%02d", $0) }
    }

    var minutes: [String] {
        return Array(0...59).map { String(format: "%02d", $0) }
     }
    
    var inputChoose = String()
    var choosedStation = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackGround()
        setUpHeader()
        setUpInput()
        setUpBookmarkButton()
        setUplistTitle()
//        setUpShceduleCard()
        setUpScheduleList()
    
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
        titlePage.font = .systemFont(ofSize: 20, weight: .semibold)
        titlePage.textColor = .black
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(backgHeader)
        view.addSubview(backButton)
        view.addSubview(titlePage)
        
        NSLayoutConstraint.activate([
            backgHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: -142),
            backgHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            titlePage.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titlePage.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 12)
        ])
    }
    
    func setUpInput(){
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let inputLogo = UIImageView(image: UIImage(named: "InputLogo"))
        inputLogo.translatesAutoresizingMaskIntoConstraints = false
        
        let timeLogo = UIImageView(image: UIImage(named: "TimeLogo"))
        timeLogo.tintColor = .green
        timeLogo.translatesAutoresizingMaskIntoConstraints = false
            
        stationPickerView.delegate = self
        stationPickerView.dataSource = self
        stationPickerView.backgroundColor = .white
        
        let placeHolderFont = UIFont.systemFont(ofSize: 17, weight: .regular)
        startingInput.attributedPlaceholder = NSAttributedString(
            string: "Set starting bus stop",
            attributes: [NSAttributedString.Key.font: placeHolderFont,
                         NSAttributedString.Key.foregroundColor: UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 0.3)]
        )
        startingInput.translatesAutoresizingMaskIntoConstraints = false
        startingInput.addTarget(self, action: #selector(startingInputTapped), for: .editingDidBegin)
        startingInput.inputView = stationPickerView
        
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
        
        let horDiv2 = UIView()
        horDiv2.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        horDiv2.translatesAutoresizingMaskIntoConstraints = false
        
        
        timeInput.attributedPlaceholder = NSAttributedString(
            string: "Set time bus stop",
            attributes: [NSAttributedString.Key.font: placeHolderFont,
                         NSAttributedString.Key.foregroundColor: UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 0.3)]
        )
        timeInput.translatesAutoresizingMaskIntoConstraints = false
        timeInput.inputView = timePickerView
        timeInput.addTarget(self, action: #selector(timeInputTapped), for: .editingDidBegin)
        
        timePickerView.delegate = self
        timePickerView.dataSource = self
        timePickerView.backgroundColor = .white
        
        view.addSubview(container)
        view.addSubview(inputLogo)
        view.addSubview(timeLogo)
        view.addSubview(startingInput)
        view.addSubview(horDiv)
        view.addSubview(destInput)
        view.addSubview(horDiv2)
        view.addSubview(timeInput)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: backgHeader.bottomAnchor, constant: -30),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
//            container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -582.47),
            
            inputLogo.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            inputLogo.topAnchor.constraint(equalTo: container.topAnchor, constant: 9),
            
            timeLogo.centerXAnchor.constraint(equalTo: inputLogo.centerXAnchor),
            timeLogo.topAnchor.constraint(equalTo: inputLogo.bottomAnchor, constant: 26),
            
            startingInput.leadingAnchor.constraint(equalTo: inputLogo.trailingAnchor, constant: 9),
            startingInput.topAnchor.constraint(equalTo: container.topAnchor, constant: 14),
            
            horDiv.heightAnchor.constraint(equalToConstant: 1),
            horDiv.leadingAnchor.constraint(equalTo: startingInput.leadingAnchor),
            horDiv.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            horDiv.topAnchor.constraint(equalTo: startingInput.bottomAnchor, constant: 14),
            
            destInput.leadingAnchor.constraint(equalTo: startingInput.leadingAnchor),
            destInput.topAnchor.constraint(equalTo: horDiv.bottomAnchor, constant: 18),
            
            horDiv2.heightAnchor.constraint(equalToConstant: 1),
            horDiv2.leadingAnchor.constraint(equalTo: startingInput.leadingAnchor),
            horDiv2.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            horDiv2.topAnchor.constraint(equalTo: destInput.bottomAnchor, constant: 14),
            
            timeInput.leadingAnchor.constraint(equalTo: startingInput.leadingAnchor),
            timeInput.centerYAnchor.constraint(equalTo: timeLogo.centerYAnchor),
            timeInput.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12)
            
        ])
    }
    
    func setUpBookmarkButton(){
        bookmrkButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bookmrkButton)
        
        bookmrkButton.addTarget(self, action: #selector(bookmrkButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            bookmrkButton.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 9),
            bookmrkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bookmrkButton.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            bookmrkButton.trailingAnchor.constraint(equalTo: container.trailingAnchor),
//            bookmrkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setUplistTitle(){
        listTitle.text = "Nearest Departure Time"
        listTitle.font = .systemFont(ofSize: 17, weight: .semibold)
        listTitle.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(listTitle)
        
        NSLayoutConstraint.activate([
            listTitle.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            listTitle.topAnchor.constraint(equalTo: bookmrkButton.bottomAnchor, constant: 21)
        ])
    }
    
    func setUpShceduleCard(){
        let busScheduleCard = BusScheduleCard(time: "12:57", name: "BSD Link Sektor 1.3", color: UIColor(red: 255/255, green: 154/255, blue: 172/255, alpha: 1), route: "Terminal Intermoda - Sektor 1.3 - Terminal Intermoda")
        busScheduleCard.translatesAutoresizingMaskIntoConstraints = false
        
        let busScheduleCard2 = BusScheduleCard(time: "13:06", name: "BSD Link De Park 1", color: UIColor(red: 65/255, green: 204/255, blue: 246/255, alpha: 1), route: "Terminal Intermoda - De Park - Terminal Intermoda(Rute 1)")
        busScheduleCard2.translatesAutoresizingMaskIntoConstraints = false
        
        let busScheduleCard3 = BusScheduleCard(time: "13:15", name: "BSD Link De Park 2", color: UIColor(red: 231/255, green: 153/255, blue: 255/255, alpha: 1), route: "Terminal Intermoda - De Park - Terminal Intermoda(Rute 2)")
        busScheduleCard3.translatesAutoresizingMaskIntoConstraints = false
        
        let busScheduleCard4 = BusScheduleCard(time: "13:23", name: "BSD Link Electric Vehicle", color: UIColor(red: 255/255, green: 190/255, blue: 112/255, alpha: 1), route: "Terminal Intermoda - ICE - QBIG - Ara Rasa - The Breeze - Digital Hub")
        busScheduleCard4.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(busScheduleCard)
        view.addSubview(busScheduleCard2)
        view.addSubview(busScheduleCard3)
        view.addSubview(busScheduleCard4)
        
        NSLayoutConstraint.activate([
            busScheduleCard.topAnchor.constraint(equalTo: listTitle.bottomAnchor, constant: 9),
            busScheduleCard.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            busScheduleCard.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            
            busScheduleCard2.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard2.topAnchor.constraint(equalTo: busScheduleCard.bottomAnchor, constant: 15),
            
            busScheduleCard3.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard3.topAnchor.constraint(equalTo: busScheduleCard2.bottomAnchor, constant: 15),
            
            busScheduleCard4.centerXAnchor.constraint(equalTo: busScheduleCard.centerXAnchor),
            busScheduleCard4.topAnchor.constraint(equalTo: busScheduleCard3.bottomAnchor, constant: 15), 
        ])
    }
    
    func setUpScheduleList(){
        let list = BusScheduleList()
        list.setUpList()
        list.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(list)
        
        NSLayoutConstraint.activate([
            list.topAnchor.constraint(equalTo: listTitle.bottomAnchor, constant: 9),
            list.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            list.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            list.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -38.47)
        ])

    }
    
    @objc func bookmrkButtonPressed(){
        print("in")
        if buttonEnable {
            bookmrkButton.buttonImage.image = UIImage(systemName: "bookmark")
            bookmrkButton.backgroundColor = .lightGray
        }
        else{
            bookmrkButton.buttonImage.image = UIImage(systemName: "bookmark.fill")
            bookmrkButton.backgroundColor = UIColor(red: 255/255, green: 131/255, blue: 37/255, alpha: 1)
        }
        
        buttonEnable.toggle()
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        // Dismiss the keyboard or picker when tapping outside
//        if startingInput.text == "" || destInput.text == "" || timeInput.text == ""{
//            print(startingInput.text)
//            print(destInput.text)
//            print(timeInput.text)
            return
//        }
//        else {
//            searchButton.isEnabled = true
//            searchButton.backgroundColor = UIColor(red: 255/255, green: 131/255, blue: 37/255, alpha: 1)
//            print("true")
//        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == stationPickerView{
            return 1
        }
        else if pickerView == timePickerView{
            return 2
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == stationPickerView{
            return stationOptions.count
        }
        else if pickerView == timePickerView{
            return component == 0 ? hours.count : minutes.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == stationPickerView{
            return stationOptions[row]
        }
        else if pickerView == timePickerView{
            return component == 0 ? hours[row] : minutes[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == stationPickerView{
            choosedStation = stationOptions[row]
            if inputChoose  == "start"{
                startingInput.text = choosedStation
            }
            else if inputChoose == "dest"{
                destInput.text = choosedStation
            }
        }
            else if pickerView == timePickerView{
                let selectedHour = hours[pickerView.selectedRow(inComponent: 0)]
                let selectedMinute = minutes[pickerView.selectedRow(inComponent: 1)]
                timeInput.text = "\(selectedHour):\(selectedMinute)"
            }
    }

}

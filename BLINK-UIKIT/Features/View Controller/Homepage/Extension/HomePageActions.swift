//
//  HomePageActions.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 06/02/24.
//

import UIKit

extension HomePageViewController{
    @objc func startingInputTapped() {
        // Show the placePickerView when the textField is tapped
        stationPickerView.isHidden = false
        inputChoose = "start"
    }
    
    @objc func destInputTapped() {
        // Show the placePickerView when the textField is tapped
        stationPickerView.isHidden = false
        inputChoose = "dest"
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true) 
        // Dismiss the keyboard or picker when tapping outside
        if startingInput.text == "" || destInput.text == "" || timeInput.text == ""{
//            print(startingInput.text)
//            print(destInput.text)
//            print(timeInput.text)
            return
        }
        else {
            searchButton.isEnabled = true
            searchButton.backgroundColor = UIColor(red: 255/255, green: 131/255, blue: 37/255, alpha: 1)
            print("true")
        }
        
    }
    
    @objc func switchButtonTapped(){
        let startStation = startingInput.text
        startingInput.text = destInput.text
        destInput.text = startStation
    }
    
    @objc func timeInputTapped(){
        timePickerView.isHidden = false
        print("in")
    }
}

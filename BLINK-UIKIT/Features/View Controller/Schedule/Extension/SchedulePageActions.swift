//
//  SchedulePageActions.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 15/02/24.
//

import Foundation
import UIKit

extension ScheduleViewController{
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
    
    @objc func timeInputTapped(){
        timePickerView.isHidden = false
        print("in")
    }
}

//
//  PickerViewFunctions.swift
//  BLINK-UIKIT
//
//  Created by Jeremy Christopher on 06/02/24.
//

import UIKit

extension HomePageViewController{
    // UIPickerViewDataSource methods
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

    // UIPickerViewDelegate method for setting the title of each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == stationPickerView{
            return stationOptions[row]
        }
        else if pickerView == timePickerView{
            return component == 0 ? hours[row] : minutes[row]
        }
        
        return nil
    }

    // UIPickerViewDelegate method for handling the selection of a row
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
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if pickerView == timePickerView{
            let totalWidth = pickerView.bounds.size.width
            let componentWidth = totalWidth / 4 // Divide the width equally for two components
            return componentWidth
        }
        return pickerView.bounds.size.width
    }
}

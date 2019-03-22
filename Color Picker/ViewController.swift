//
//  ViewController.swift
//  Color Picker
//
//  Created by Julia Wopata on 3/21/19.
//  Copyright © 2019 Julia Wopata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var detailLabel: UILabel!
    struct Color {
        var color: String
        var uiColor: UIColor
        
        init(color: String, uiColor: UIColor){
            self.color = color
            self.uiColor = uiColor
        }
    }
    
    private var dataSource = [Color(color: "Red", uiColor: UIColor.red),
                              Color(color: "Orange", uiColor: UIColor.orange),
                              Color(color: "Yellow", uiColor: UIColor.yellow),
                              Color(color: "Green", uiColor: UIColor.green),
                              Color(color: "Blue", uiColor: UIColor.blue),
                              Color(color: "Purple", uiColor: UIColor.purple)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        let initialRow = 0
        self.view.backgroundColor = dataSource[initialRow].uiColor
        detailLabel.text = dataSource[initialRow].color
        pickerView.selectedRow(inComponent: initialRow)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        detailLabel.text = dataSource[row].color
        self.view.backgroundColor = dataSource[row].uiColor
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row].color
    }
}


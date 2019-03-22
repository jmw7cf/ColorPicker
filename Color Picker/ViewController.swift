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
    }

    var red = Color(color: "Red", uiColor: UIColor.red)
    var orange = Color(color: "Orange", uiColor: UIColor.orange)
    var yellow = Color(color: "Yellow", uiColor: UIColor.yellow)
    var green = Color(color: "Green", uiColor: UIColor.green)
    var blue = Color(color: "Blue", uiColor: UIColor.blue)
    var purple = Color(color: "Purple", uiColor: UIColor.purple)
    
    private lazy var dataSource: [Color] = [red, orange, yellow, green, blue, purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        self.view.backgroundColor = dataSource[0].uiColor
        detailLabel.text = dataSource[0].color
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


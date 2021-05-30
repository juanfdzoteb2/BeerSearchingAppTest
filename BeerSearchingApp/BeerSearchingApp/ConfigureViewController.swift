//
//  ConfigureViewController.swift
//  BeerSearchingApp
//
//  Created by Juan Fernández Otero on 30/5/21.
//

import UIKit

class ConfigureViewController: UIViewController {

    
    @IBOutlet weak var switchFilter: UISwitch!
    @IBOutlet weak var sliderBitterness: UISlider!
    @IBOutlet weak var labelBitterness: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let valueBitternes = SharedPreferences.shared.readBitternessValue()
        sliderBitterness.value = Float(valueBitternes)
        labelBitterness.text = "\(valueBitternes)"
        switchFilter.isOn  = SharedPreferences.shared.readFilterBitternessBool()
        
    }
    
    @IBAction func changeSwitchValue(_ sender: UISwitch) {
        SharedPreferences.shared.writefilterBitternessBool(value: sender.isOn)
    }
    
    @IBAction func onChangeValue(_ sender: UISlider) {

        let currentValue = Int(sender.value)
        labelBitterness.text = "\(currentValue)"
        SharedPreferences.shared.writeBitternessValue(value: currentValue)


    }
    
}

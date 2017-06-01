//
//  ViewController.swift
//  JfiggTest
//
//  Created by Brian on 6/1/17.
//  Copyright © 2017 Fleury Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var TipPercent:Double = 0
    
    @IBOutlet weak var TipVal: UILabel!
    @IBOutlet weak var TotalVal: UILabel!
    @IBAction func PercentVal(_ sender: Any) {
        CalculateTip()
    }
    @IBOutlet weak var PercentOut: UISegmentedControl!
    @IBOutlet weak var AmountOut: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        AmountOut.addTarget(self, action: #selector(TextFieldDidChange), for: .editingChanged)
        PercentOut.selectedSegmentIndex = 1
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return true
    }
    
    func TextFieldDidChange() {
        CalculateTip()
    }
    func CalculateTip(){
        switch(PercentOut.selectedSegmentIndex){
        case 0: TipPercent = 10
        case 1: TipPercent = 20
        case 2: TipPercent = 30
        default: TipPercent = 10
        }
        let BillDefault = AmountOut.text?.characters.count
        if (BillDefault! > 0){
            let Numbers = Double(AmountOut.text!)
            let Tip = Numbers! * TipPercent / 100
            let Total = Numbers! + Tip
            let Formater = NumberFormatter()
            Formater.numberStyle = .currency
            Formater.locale = Locale(identifier: "en-US")
            TipVal.text = Formater.string(from: Tip as NSNumber)
            TotalVal.text = Formater.string(from: Total as NSNumber)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        AmountOut.resignFirstResponder()
        super.touchesBegan(touches, with: event)
    }
}


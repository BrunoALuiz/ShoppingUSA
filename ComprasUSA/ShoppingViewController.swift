//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Bruno Luiz on 03/07/19.
//  Copyright © 2019 Bruno Luiz. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDolar.resignFirstResponder()
        setAmount()
    }

    func setAmount() {
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        lbRealDescription.text = "Valor do dólar (\(dolar))"
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValueInReal, withCurrency: "R$ ")
    }

}


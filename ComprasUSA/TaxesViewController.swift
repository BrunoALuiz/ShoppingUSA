//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Bruno Luiz on 03/07/19.
//  Copyright © 2019 Bruno Luiz. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxDescription: UILabel!
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        lbStateTaxDescription.text =
            "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateTax, withCurrency: ""))%)"
        lbIOFDescription.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: ""))%)"
        
        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "U$ ")
        lbStateTax.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "U$ ")
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "U$ ")
        
        let real = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getFormattedValue(of: real, withCurrency: "R$ ")
    }

}

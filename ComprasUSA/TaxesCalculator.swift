//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Bruno Luiz on 14/08/19.
//  Copyright © 2019 Bruno Luiz. All rights reserved.
//

import Foundation

class TaxesCalculator {
    
    // Singleton: Create unique instance of this object
    static let shared = TaxesCalculator()
    
    var dolar: Double = 3.5
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    let formatter = NumberFormatter()
    
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    var stateTaxValue: Double {
        return shoppingValue * stateTax / 100
    }
    var iofValue: Double {
        return (shoppingValue + stateTaxValue) * iof / 100
    }
    
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue: Double = shoppingValue + stateTaxValue
        if usingCreditCard {
            finalValue += iofValue
        }
        return finalValue * dolar
    }
    
    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    private init() {
        formatter.usesGroupingSeparator = true
    }
    
}

//
//  Currency.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 07.01.2022.
//

import Foundation

struct Currency {
    var name: String
    var code: String
    var symbol: String?

    static var allCurrencies: [Currency] = {
        let currencies: [Currency] = Locale.isoCurrencyCodes.compactMap {
            guard let name = Locale.current.localizedString(forCurrencyCode: $0) else {
                return nil
            }
            let symbol = getSymbol(forCurrencyCode: $0)
            return Currency(name: name, code: $0, symbol: symbol)
        }
        return currencies
    }()

    private static func getSymbol(forCurrencyCode code: String) -> String? {
        let localeComponents = [NSLocale.Key.currencyCode.rawValue: code]
        let localeIdentifier = NSLocale.localeIdentifier(fromComponents: localeComponents)
        let locale = NSLocale(localeIdentifier: localeIdentifier)
        let currencySymbol = locale.object(forKey: NSLocale.Key.currencySymbol) as? String ?? nil

        return currencySymbol
    }
}

import Foundation

typealias CurrencyExchangeRate = [String: [String: String]]

class CurrencyExchange {
    // Holding available exchange rates. in a real scenario, you can get this from an api or datastore
    private static let exchangeRates: CurrencyExchangeRate = [
        "USD": [
            "USD": "1.0",
            "GBP": "0.73",
            "EUR": "0.85",
            "BTC": "0.000021"
        ],
        "GBP": [
            "USD": "1.37",
            "GBP": "1.0",
            "EUR": "1.16",
            "BTC": "0.000016"
        ],
        "EUR": [
            "USD": "1.17",
            "GBP": "0.86",
            "EUR": "1.0",
            "BTC": "0.000019"
        ],
        "BTC": [
            "USD": "47000.0",
            "GBP": "62000.0",
            "EUR": "53000.0",
            "BTC": "1.0"
        ]
    ]
    
    static func convert(_ value: Double, from baseCurrency: String = "USD", to currency: Currency) -> Double {
        guard currency.code != baseCurrency else {
            return value
        }
        
        guard let exchangeRate = CurrencyExchange.exchangeRates["USD"]?[currency.code],
              let exchangeRateValue = Double(exchangeRate) else {
            return value
        }
        
        return value * exchangeRateValue
    }

    
    static func convertAndFormat(_ value: Double, from baseCurrency: String = "USD", to currency: Currency) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency.symbol
        
        guard currency.code != baseCurrency else {
            return formatter.string(from: NSNumber(value: value)) ?? "\(currency.symbol)\(value)"
        }
        
        guard let exchangeRate = CurrencyExchange.exchangeRates["USD"]?[currency.code],
              let exchangeRateValue = Double(exchangeRate) else {
            return "\(currency.symbol)\(value)" // here, we're returning the value as is, you can also throw an error
        }
        
        let convertedValue = value * exchangeRateValue
        guard let formattedExchangeRate = formatter.string(from: NSNumber(value: convertedValue)) else {
            return "\(convertedValue)"
        }
        
        return "\(formattedExchangeRate)"
    }
    
}

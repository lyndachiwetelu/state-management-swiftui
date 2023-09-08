
import Foundation

struct Currency: Hashable {
    let name: String
    let code: String
    let symbol: String
}

// Static list of currencies
class CurrencyList {
    static let baseCurrency: Currency =  Currency(name: "US Dollar", code: "USD", symbol: "$")
    
    let currencies: [Currency] = [
        Currency(name: "Euro", code: "EUR", symbol: "€"),
        Currency(name: "Pounds", code: "GBP", symbol: "£"),
        Currency(name: "Bitcoin", code: "BTC", symbol: "₿"),
    ]
}


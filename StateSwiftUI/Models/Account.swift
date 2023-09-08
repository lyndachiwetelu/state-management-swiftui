import Foundation

struct Account: Hashable  {
    let name: String
    var value: Double
    
    mutating func increment(by num: Double) {
        print("Incrementing \(name) by \(num)")
        self.value += num
    }
}

class AccountsData: ObservableObject {
    @Published var income: Account
    @Published var expenses: Account
    var balance: Account
    @Published var investment: Account
    @Published var debt: Account
    
    init() {
        income = Account(name: "Income", value: 230000)
        expenses = Account(name: "Expenses", value: 130000)
        balance = Account(name: "Balance", value: 70000)
        investment = Account(name: "Investments", value: 30000)
        debt = Account(name: "Debt", value: 48000)
    }
}


import SwiftUI

struct MainView: View {
    @StateObject private var accounts = AccountsData()
    
    private let currencyList = CurrencyList()
    @State private var selectedCurrency: Currency = CurrencyList.baseCurrency
    
    var body: some View {
        VStack {
            
            // Header
            HStack {
                Text("My Money Manager").font(.system(size: 18, weight: .black)).foregroundColor(Color("AppBlue"))
                
                HStack {
                    Picker("Currency", selection: $selectedCurrency) {
                        Text(CurrencyList.baseCurrency.code).tag(CurrencyList.baseCurrency)
                        ForEach(currencyList.currencies, id: \.code) { currency in
                            Text(currency.code).tag(currency)
                        }
                    }
                }
            }.padding(.bottom, 30)
            
            
            // Balance
            Text("Total Balance in \(selectedCurrency.name): \(CurrencyExchange.convertAndFormat(accounts.balance.value, to: selectedCurrency))").font(.system(size: 18, weight: .bold)).padding(.bottom, 20)
            
            // ChartView
            ChartView(accounts: accounts, currency: selectedCurrency)
            
            // Summary Views
            Grid(horizontalSpacing: 10, verticalSpacing: 20) {
                GridRow {
                    IncomeView(account: accounts.income, currency: selectedCurrency )
                    
                    ExpenseView(account: accounts.expenses, currency: selectedCurrency )
                }
                
                GridRow {
                    DebtView(account: accounts.debt, currency: selectedCurrency )
                    
                    InvestmentView(account: accounts.investment, currency: selectedCurrency )
                }
                
            }
            
            
            // ActionsView
            ActionView(accounts: accounts, currency: $selectedCurrency)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

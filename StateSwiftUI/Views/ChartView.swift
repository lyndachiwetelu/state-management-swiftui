
import SwiftUI
import Charts

struct ChartView: View {
    @ObservedObject var accounts: AccountsData
    let currency: Currency
    
    var body: some View {
        Chart {
                BarMark(
                    x: .value("Income", accounts.income.name),
                    y: .value("Amount in \(currency.code)", CurrencyExchange.convert(accounts.income.value, to: currency))
                )
                .foregroundStyle(Color("AppGreen"))
            
                BarMark(
                    x: .value("Expenses", accounts.expenses.name),
                    y: .value("Amount in \(currency.code)", CurrencyExchange.convert(accounts.expenses.value, to: currency))
                )
                .foregroundStyle(Color("AppPink"))
            
            
                BarMark(
                    x: .value("Debt", accounts.debt.name),
                    y: .value("Amount in \(currency.code)", CurrencyExchange.convert(accounts.debt.value, to: currency))
                )
                .foregroundStyle(Color("AppGold"))
            
                BarMark(
                    x: .value("Investment", accounts.investment.name),
                    y: .value("Amount in \(currency.code)", CurrencyExchange.convert(accounts.investment.value, to: currency))
                )
                .foregroundStyle(Color("AppBlue"))

        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(accounts: AccountsData(), currency: CurrencyList.baseCurrency)
    }
}

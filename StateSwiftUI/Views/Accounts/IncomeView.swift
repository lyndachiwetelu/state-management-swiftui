
import SwiftUI

struct IncomeView: View {
    var account: Account
    var currency: Currency
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text("Income").font(.system(size: 22, weight: .bold))
            Text(CurrencyExchange.convertAndFormat(account.value, to: currency)).font(.system(size: 25))
        }
        .frame(width: 180, height: 100)
        .background(Color("AppGreen"))
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}

struct IncomeView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeView(account: Account(name: "Income", value: 1000), currency: CurrencyList.baseCurrency)
    }
}


import SwiftUI

struct ExpenseView: View {
    var account: Account
    var currency: Currency
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text("Expenses").font(.system(size: 22, weight: .bold))
            Text(CurrencyExchange.convertAndFormat(account.value, to: currency))
                .font(.system(size: 25))
        }
        .frame(width: 180, height: 100)
        .background(Color("AppPink"))
        .foregroundColor(.black)
        .cornerRadius(12)
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView(account: Account(name: "Expenses", value: 1000), currency: CurrencyList.baseCurrency)
    }
}



import SwiftUI

struct DebtView: View {
    var account: Account
    var currency: Currency
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text("Debt").font(.system(size: 22, weight: .bold))
            Text(CurrencyExchange.convertAndFormat(account.value, to: currency)).font(.system(size: 25))
        }
        .frame(width: 180, height: 100)
        .background(Color("AppGold"))
        .foregroundColor(.black)
        .cornerRadius(12)
    }
}

struct DebtView_Previews: PreviewProvider {
    static var previews: some View {
        DebtView(account:Account(name: "Debt", value: 1000), currency: CurrencyList.baseCurrency)
    }
}

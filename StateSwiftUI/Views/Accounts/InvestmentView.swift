
import SwiftUI

struct InvestmentView: View {
    var account: Account
    var currency: Currency
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text("Investments").font(.system(size: 22, weight: .bold))
            Text(CurrencyExchange.convertAndFormat(account.value, to: currency)).font(.system(size: 25))
        }
        .frame(width: 180, height: 100)
        .background(Color("AppBlue"))
        .foregroundColor(.black)
        .cornerRadius(12)
    }
}

struct InvestmentView_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentView(account: Account(name: "Investments", value: 1000), currency: CurrencyList.baseCurrency)
    }
}

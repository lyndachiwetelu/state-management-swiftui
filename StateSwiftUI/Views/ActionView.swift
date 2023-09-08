
import SwiftUI

struct ActionView: View {
    var accounts: AccountsData
    @Binding var currency: Currency
    
    var body: some View {
        VStack {
            Text("Actions").font(.headline).padding(.bottom, 20)
            
            VStack(spacing: 20) {
                HStack {
                    Button("Add Income") {
                        // Do add income action here
                        accounts.income.increment(by: 10000)
                    }
                    .padding(20)
                    .frame(width: 170, height: 40)
                    .background(Color("AppGreen"))
                    .foregroundColor(.white)
                    .cornerRadius(200)
                    
                    Spacer()
                    
                    Button("Add Expense") {
                        // do add expense action here
                        accounts.expenses.increment(by: 5000)
                    }
                    .padding(20)
                        .frame(width: 170, height: 40)
                        .background(Color("AppPink"))
                        .foregroundColor(.black)
                        .cornerRadius(200)
                }
                
                HStack {
                    Button("Add Debt") {
                        // Do add debt action here
                        accounts.debt.increment(by: 2000)
                    }
                    .padding(20)
                    .frame(width: 170, height: 40)
                    .background(Color("AppGold"))
                    .foregroundColor(.black)
                    .cornerRadius(200)
                    
                    Spacer()
                    
                    Button("Add Investment") {
                        // do add investment action here
                        accounts.investment.increment(by: 1000)
                    }
                    .padding(20)
                        .frame(width: 170, height: 40)
                        .background(Color("AppBlue"))
                        .foregroundColor(.white)
                        .cornerRadius(200)
                }
                
                
                Text("Reset to Default Currency").padding(.top, 20).foregroundColor(Color("AppBlue"))
                    .onTapGesture {
                        
                    // Reset currency here
                    currency = CurrencyList.baseCurrency
                    
                }
            }.padding(.leading, 20).padding(.trailing, 20)
        }
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(Color(.lightGray).opacity(0.4))
            .cornerRadius(20)
            .padding(.all, 10)
            .padding(.top, 20)
    }
}

struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView(accounts: AccountsData(), currency: .constant(CurrencyList.baseCurrency))
    }
}

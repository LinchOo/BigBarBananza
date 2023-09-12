//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

struct LincensePurchaseInfoView: View {
    @Binding var clouse: Bool
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Instructions")
                Spacer()
                ZStack(alignment: .topTrailing){
                    Button{
                        clouse.toggle()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                
            }
            List{
                Section(header: Text("Purchaise Directions")){
                    HStack(alignment: .top){
                        Text("Standart:")
                            .fontWeight(.medium)
                            .frame(maxWidth: 75)
                        Text("no privilegies")
                    }
                    HStack(alignment: .top){
                        Text("Premium:")
                            .fontWeight(.medium)
                            .frame(maxWidth: 75)
                        VStack(alignment: .leading, spacing: 0){
                            Text("✔️+1.5kg on reserve")
                            Text("✔️open rental")
                            Text("✔️participation in tournament")
                        }
                    }
                    HStack(alignment: .top){
                        Text("Luxury:")
                            .fontWeight(.medium)
                            .frame(maxWidth: 75)
                        VStack(alignment: .leading, spacing: 0){
                            
                            Text("✔️+3kg on reserve")
                            Divider()
                            Text("✔️best rental equipment")
                            Divider()
                            Text("✔️best price in reserve shop")
                            Divider()
                            Text("✔️free participation in tournament")
                        }
                        
                    }
                    Text("Fill out the form and we will contact you for further instructions.")
                }
                Section(header: Text("Redeem Directions")){
                    Text("Enter Promo code to win some prizes, like coupon on enter, discount, ore some fishing gear, have a luck and see you in a shore fisherman.")
                }
            }
            .listStyle(.grouped)
        }
        .padding(.vertical)
    }
}

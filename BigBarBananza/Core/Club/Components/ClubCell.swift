//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

struct ClubCell: View {
    
    var viewModel: ClubModel
    
    var body: some View {
        VStack{
            old_version2
            HStack{
                // Limits
                Image("limits")
                    .resizable()
                    .frame(maxWidth: 35,maxHeight: 35)
                    .scaledToFit()
                Text(viewModel.limit+"kg")
                    .foregroundColor(.black)
                    .font(.custom("Scalter-Regular", size: 20))
                
                Spacer()
                // Services
                if viewModel.shore {
                    Image("shore_fishing")
                        .resizable()
                        .frame(maxWidth: 35,maxHeight: 35)
                        .scaledToFit()
                }
                if viewModel.boat {
                    Image("boat_fishing")
                        .resizable()
                        .frame(maxWidth: 35,maxHeight: 35)
                        .scaledToFit()
                }
                if viewModel.rent {
                    Image("fishing_rent")
                        .resizable()
                        .frame(maxWidth: 35,maxHeight: 35)
                        .scaledToFit()
                }
                if viewModel.shop {
                    Image("fishing_reel")
                        .resizable()
                        .frame(maxWidth: 35,maxHeight: 35)
                        .scaledToFit()
                    Image("bait")
                        .resizable()
                        .frame(maxWidth: 35,maxHeight: 35)
                        .scaledToFit()
                }
            }
            .padding()
            .background(.ultraThinMaterial)
        }
//        .frame(maxHeight: 420)
        .background(.ultraThinMaterial)
        .cornerRadius(15)
        .padding()
        .shadow(radius: 1.5)
    }
}

extension ClubCell {
    private var old_version2: some View {
        ZStack(alignment: .topLeading){
            // Photo
            TabView{
                ForEach(viewModel.imgNames, id: \.self ){ img in
                    VStack{
                        Image(img)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .tabViewStyle(.page)
            // Name
            Text(viewModel.clubName)
                .font(.custom("YeastyFlavors-Regular", size: 15))
                .foregroundColor(.black)
                .shadow(radius: 0.3)
                .padding(5)
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                .offset(x:5,y:20)
        }
        .padding()
    }
}

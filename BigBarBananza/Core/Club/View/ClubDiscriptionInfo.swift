//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

struct ClubDiscriptionInfo: View {
    @Binding var clouse: Bool
    var body: some View {
        VStack(alignment: .leading){
            Section{
                HStack{
                    Spacer()
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    ZStack{
                        Button{
                            clouse.toggle()
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
            }
            Divider()
            Section{
                HStack{
                    Image("limits")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                    Text("Fish out limit on current place.")
                }
                Divider()
                HStack{
                    Image("boat_fishing")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                    Text("Here you can fish from boat.")
                }
                Divider()
                HStack{
                    Image("shore_fishing")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                    Text("Here you can fish from shore.")
                }
                Divider()
                HStack{
                    Image("fishing_rent")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                    Text("Equipment rental available.")
                }
                Divider()
                HStack{
                    Image("fishing_reel")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                    Text("There is a store on site.")
                }
            }
            Spacer()
        }
        .padding()
        .padding(.horizontal,30)
        
        
    }
}

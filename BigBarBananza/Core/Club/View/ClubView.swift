//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

struct ClubView: View {
    
    @EnvironmentObject private var viewModel: ClubViewModel
    @State private var isShowInfo: Bool = false
    @State private var orientation = UIDevice.current.orientation

    var body: some View {
        Group{
            if orientation.isLandscape{
                landscapeOrientation
            }else {
                portraitOrientation
            }
        }
        .detectOrientation($orientation)
        .sheet(isPresented: $isShowInfo){
            ClubDiscriptionInfo(clouse: $isShowInfo)
        }
    }
// MARK: - Portrait Orientation
    private var portraitOrientation : some View {
        VStack{
            ZStack{
                Image("logo")
                    .resizable()
                    .frame(maxWidth: 120,maxHeight: 120)
                    .scaledToFit()
                Button{
                    isShowInfo.toggle()
                }label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(maxWidth: 35,maxHeight: 35)
                        .background{
                            Color.cyan
                                .cornerRadius(15)
                        }
                        .shadow(radius: 0.3)
                }
                .offset(x: 150)
            }
            ScrollView(showsIndicators: false){
                ForEach(viewModel.clubs) { club in
                    VStack{
                        ClubCell(viewModel: club)
                    }
                    .frame(height: 420)
                }
            }
        }
    }
// MARK: - Landskape Orientation
    private var landscapeOrientation : some View {
        VStack{
            ZStack(alignment: .topTrailing){
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(viewModel.clubs) { club in
                            ClubCell(viewModel: club)
                                .frame(maxWidth: 300, maxHeight: 280)
                        }
                    }
                }
                Button{
                    isShowInfo.toggle()
                }label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(maxWidth: 35,maxHeight: 35)
                        .background{
                            Color.cyan
                                .cornerRadius(15)
                        }
                        .shadow(radius: 0.3)
                }
                .offset(x: -15, y: 15)
                
            }
            Spacer()
        }
        .background{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 350,maxHeight: 350)
        }
    }
}

struct ClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubView()
            .environmentObject(ClubViewModel())
    }
}

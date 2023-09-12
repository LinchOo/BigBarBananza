//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

struct MoreInfoView: View {
    @EnvironmentObject private var viewModel: NewsViewModel
    let new: NewsModel
    
    var body: some View {
        VStack{
            // News Photos
            Image(new.imgName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: UIScreen.main.bounds.width)
                .clipped()
                .tabViewStyle(.page)
                .overlay(backButton, alignment: .topLeading)
            
            // News Text
            
                Divider()
                Text(new.titleText)
                    .foregroundColor(.blue)
                    .font(.title)
                    .shadow(color: Color.black, radius: 0.5)
                Text(new.dateEventText)
                    .foregroundColor(.blue)
                    .shadow(color: Color.black, radius: 0.5)
                Divider()
            ScrollView(.vertical, showsIndicators: false){
                Text(new.description)
                    //.padding(.top,30)
                
            }
            .padding()
        }
        .padding(.vertical)
        .background{
//            Image("background")
//                .resizable()
//                .ignoresSafeArea()
        }
    }
}


extension MoreInfoView {
    private var backButton: some View {
        Button{
            viewModel.newsSheet = nil
        }label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(4)
                .shadow(radius: 4)
                .padding()
        }
    }
}

struct MoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoView(new: NewsDataService.newsDB.first!)
            .environmentObject(NewsViewModel())
    }
}

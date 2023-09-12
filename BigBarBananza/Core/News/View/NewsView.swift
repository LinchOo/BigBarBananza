//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject private var viewModel: NewsViewModel
    @State private var orientation = UIDevice.current.orientation

    
    var body: some View {
        Group{
            if orientation.isLandscape{
                landscapeOrientation
            } else{
                portraitOrientation
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width,maxHeight: UIScreen.main.bounds.height)
        .detectOrientation($orientation)
        .sheet(item: $viewModel.newsSheet, content: { news in
            MoreInfoView(new: news)
        })
        
    }
    // MARK: - Portrait Orientation
    private var portraitOrientation : some View {
        VStack{
            VStack{
                Image("logo")
                    .resizable()
                    .frame(maxWidth: 120,maxHeight: 120)
                    .scaledToFit()
            }
            ScrollView(.vertical,showsIndicators: false){
                ForEach(viewModel.news){ new in
                    Button{
                        viewModel.newsSheet = new
                    }label: {
                        NewsCell(imgName: new.imgName, titleText: new.titleText, dateEventText: new.dateEventText)
                    }
                }
            }
        }
    }
    
    // MARK: - Landskape Orientation
    private var landscapeOrientation : some View {
        VStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(viewModel.news){ new in
                        Button{
                            viewModel.newsSheet = new
                        }label: {
                            NewsCell(imgName: new.imgName, titleText: new.titleText, dateEventText: new.dateEventText)
                                .frame(maxWidth: 300,maxHeight: 280)
                        }
                    }
                }
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



struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(NewsViewModel())

    }
}

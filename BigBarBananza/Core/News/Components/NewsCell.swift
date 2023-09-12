//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

struct NewsCell: View {
    var imgName: String
    var titleText: String
    var dateEventText: String
    
    var body: some View {
        VStack{
            VStack{
                Image(imgName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width-64)
                    .clipped()
            }
            HStack{
                Text(titleText)
                    .font(.title2)
                    //.fontWeight(.medium)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Spacer()
                Divider()
                    .frame(maxHeight: 25)
                Text(dateEventText)
                    .font(.headline)
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .lineLimit(1)
                    
            }
            .minimumScaleFactor(0.8)
            .padding()
            .background(.ultraThinMaterial)
        }
        
        .background(.ultraThinMaterial)
        .cornerRadius(15)
        .padding()
        .shadow(radius: 1)
    }
}

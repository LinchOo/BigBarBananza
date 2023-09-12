//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import Foundation

struct NewsModel: Identifiable {
    
    var imgName: String
    var titleText: String
    var placeEventText: String
    var dateEventText: String
    var description: String
    
    var id: String {
        titleText + placeEventText + dateEventText
    }
}


//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import Foundation

struct ClubModel: Identifiable {
    var imgNames: [String]
    var clubName: String
    var limit: String
    
    var rent: Bool
    var boat: Bool
    var shore: Bool
    var shop: Bool
    
    var id: String {
        clubName+limit
    }
}

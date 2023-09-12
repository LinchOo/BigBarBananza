//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case news, qr, club
    var iconName: String{
//        switch self {
//        case .news: return "house"
//        case .qr: return "barcode.viewfinder"
//        case .club: return "beach.umbrella"
//        }
        switch self {
        case .news: return "newspaper"
        case .qr: return "qr-code"
        case .club: return "fishing"
        }
    }
    var title: String{
        switch self {
        case .news: return "News"
        case .qr: return "QR"
        case .club: return "Club"
        }
    }
    var color: Color {
        switch self {
        case .news: return Color.green
        case .qr: return Color.black
        case .club: return Color.blue
        }
    }
}

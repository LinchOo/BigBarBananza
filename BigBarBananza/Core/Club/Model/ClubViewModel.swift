//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

struct ClubDataService {
    static let clubDB: [ClubModel] = [
    ClubModel(imgNames: ["Fish_Gold","image","logo"],
              clubName: "Lorvile River",
              limit: "3.5",
              rent: true,
              boat: true,
              shore: false,
              shop: false),
    ClubModel(imgNames: ["image","Fish_Gold","logo"],
              clubName: "Balu Lake",
              limit: "3",
              rent: false,
              boat: false,
              shore: true,
              shop: true),
    ClubModel(imgNames: ["image","Fish_Gold","logo"],
              clubName: "BlackRock Lake",
              limit: "4",
              rent: false,
              boat: true,
              shore: true,
              shop: false),
    ClubModel(imgNames: ["Fish_Gold","image","logo"],
              clubName: "Nevermore River",
              limit: "5",
              rent: true,
              boat: true,
              shore: true,
              shop: true),
    ClubModel(imgNames: ["image","Fish_Gold","logo"],
              clubName: "Fon Lake",
              limit: "4.5",
              rent: false,
              boat: false,
              shore: true,
              shop: true),
    ClubModel(imgNames: ["Fish_Gold","image","logo"],
              clubName: "Mans River",
              limit: "3.5",
              rent: true,
              boat: true,
              shore: false,
              shop: false),
    ClubModel(imgNames: ["image","Fish_Gold","logo"],
              clubName: "LongRock Lake",
              limit: "4",
              rent: true,
              boat: false,
              shore: true,
              shop: false)
    ]
}

class ClubViewModel: ObservableObject {
    @Published var clabsSheet: ClubModel? = nil
    @Published var clubs: [ClubModel]
    
    
    init() {
        let club = ClubDataService.clubDB
        self.clubs = club
    }
    
}

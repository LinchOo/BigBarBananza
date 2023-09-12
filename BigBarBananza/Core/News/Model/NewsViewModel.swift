//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

class NewsDataService {
    static let newsDB: [NewsModel] = [
        NewsModel(imgName: "image",
                  titleText: " Season is Open ",
                  placeEventText: "Lorvile River",
                  dateEventText: "3.07.2023",
                  description:
                    """
                    We are thrilled to announce the start of the new Spring-Summer fishing season, which promises to be the most thrilling and captivating event for all fishing enthusiasts. Get ready for unforgettable adventures on the water, discovering new locations, and catching the biggest trophy specimens! \n\n  With the new season comes a fresh opportunity to indulge in the pleasures of fishing to the fullest. Whether you are an experienced angler or just starting your journey in this exhilarating hobby, the new season offers plenty of opportunities for all skill levels. \n\n  Prepare to encounter a diverse range of fish species, including salmon, perch, pike, trout, and more. Whether you choose freshwater lakes, rivers, or the open sea, each location promises to bring you an unforgettable experience and unique memories. \n\n  The new fishing season also offers an opportunity to exchange experiences and knowledge with fellow enthusiasts. Join fishing clubs, events, and competitions where you can share your stories, learn new fishing techniques, and, of course, compete for the title of the most skilled angler. \n\n  The time has come to embark on a fishing trip and immerse yourself in the beauty of nature. Grab your gear, check your fishing rods, load up the boat, and get ready for an exciting start to the new fishing season. Whether you are a sports fisherman, a peaceful angler, or simply seeking a tranquil getaway, this season promises to be unforgettable. \n\n  Don't miss the chance to dive into the world of fishing adventures! The start of the new fishing season brings new opportunities, new trophies, and new memories. Get ready for the best fishing season you've ever experienced!
                  """),
        NewsModel(imgName: "Fish_Gold",
                  titleText: "Trophy Hunt Tornament 🎣",
                  placeEventText: "Nevermore River",
                  dateEventText: "3.08.2023",
                  description:
"""
    🏆 "Trophy Hunt" Fishing Tournament invites all fishing enthusiasts to an exciting battle of rods and nerves! 🐟

    📅 Date: [3.08.2023]
    🌍 Location: [Lorvile River]

    🌟 What awaits you at our tournament? 🌟

    1️⃣ Unique trophies: Seek your fishing luck to catch the perfect trophy candidate! From camouflaged pikeperch to bearded pike, amazing fish species await you.

    2️⃣ Emotional experiences: Set sail with other passionate anglers into the waters and enter a fishing paradise where the beauty of nature and the tranquility of the lake surround you.

    3️⃣ Friendly competition: Compete with experienced anglers from around the world and showcase your skills in handling the waves and catching the biggest fish!

    4️⃣ Rich prizes: Seize the tournament's main trophy and become the king of the fishing world! Awards and prizes will be presented to winners in various categories, including the largest fish, the most caught fish, and much more.

    5️⃣ Exciting entertainment: The tournament is not just about fishing! Enjoy diverse entertainment, including fishing seminars, quizzes, and demonstrations of modern fishing gear.

    Don't miss the opportunity to become a fishing legend! Join the "Trophy Hunt" Fishing Tournament and immerse yourself in the thrilling world of fishing.
    Don't miss your chance for a fishing adventure! 🎣🌟
""")
    ]
}


class NewsViewModel: ObservableObject {
    @Published var newsSheet: NewsModel? = nil
    @Published var news: [NewsModel]
    
    
    init() {
        let news = NewsDataService.newsDB
        self.news = news
    }
    
}

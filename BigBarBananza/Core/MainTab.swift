//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

struct MainTab: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .club
//    @StateObject var store = Store()
    
    @StateObject private var newsViewModel = NewsViewModel()
    @StateObject private var clubViewModel = ClubViewModel()
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            NewsView()
                .environmentObject(newsViewModel)
                .tabBarItem(tab: .news, selection: $tabSelection)
            DiscontView()
//                .environmentObject(store)
                .tabBarItem(tab: .qr, selection: $tabSelection)
            ClubView()
                .environmentObject(clubViewModel)
                .tabBarItem(tab: .club, selection: $tabSelection)
        }
        .background{
            VStack{
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .news, .qr, .club
    ]
    static var previews: some View {
        MainTab()
    }
}

struct OrientationDetector: ViewModifier {
    @Binding var orientation: UIDeviceOrientation
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                orientation = UIDevice.current.orientation
            }
    }
}
extension View {
    func detectOrientation(_ binding: Binding<UIDeviceOrientation>) -> some View {
        self.modifier(OrientationDetector(orientation: binding))
    }
}

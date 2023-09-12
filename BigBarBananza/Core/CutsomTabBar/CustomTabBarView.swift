//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    
    var body: some View {
        tabView
            .shadow(radius: 1)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .news, .qr, .club
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
        }
    }
}

extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack{
            Image(tab.iconName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 35)
            Text(tab.title)
                .font(.system(size: 15, weight: selection == tab ? .medium : .light , design: .rounded))
        }
        .foregroundColor(.black)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background{
            ZStack {
                if selection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue.opacity(0.3))
                        .matchedGeometryEffect(id: "background_rectangle2", in: namespace)
                }
            }
        }
    }
    
    private var tabView: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3),radius: 10, x:0 , y:5)
        .padding(.horizontal)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
}

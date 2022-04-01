import SwiftUI

struct CustomTabBarView: View {
    @Binding var selection: TabBarItem
    @Namespace private var nameSpace
    @State var localSelection: TabBarItem
    
    let tabs: [TabBarItem]
    
    var body: some View {
        tabBarVersionTwo
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

extension CustomTabBarView {
    
    private func customTabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : .clear)
        .cornerRadius(10)
    }
    
    private func switchTab(tab: TabBarItem) {
        selection = tab
    }
    
    private var tabBarVersionOne: some View {
        VStack{
            Spacer()
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    customTabView(tab: tab)
                        .onTapGesture {
                            switchTab(tab: tab)
                        }
                }
            }.padding(6)
                .background(Color.white.edgesIgnoringSafeArea(.bottom))
        }
    }
}

extension CustomTabBarView {
    
    private func customTabView2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle",
                                               in: nameSpace)
                }
            }
        )
        .cornerRadius(10)
    }
    
    private var tabBarVersionTwo: some View {
        VStack{
            Spacer()
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    customTabView2(tab: tab)
                        .onTapGesture {
                            switchTab(tab: tab)
                        }
                }
            }.padding(6)
                .background(Color.white.edgesIgnoringSafeArea(.bottom))
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                .padding(.horizontal)
        }
    }

}

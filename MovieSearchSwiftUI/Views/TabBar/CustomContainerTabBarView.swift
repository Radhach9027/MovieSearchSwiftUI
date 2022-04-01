import SwiftUI

struct CustomContainerTabBarView<Content: View>: View {
    let content: Content
    @Binding var selection: TabBarItem
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
 
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            CustomTabBarView(selection: $selection, localSelection: selection, tabs: tabs)
        }
        .onPreferenceChange(TabBarItemPreferencesKey.self) { value in
            self.tabs = value
        }
    }
}

import SwiftUI

struct TabBarItemPreferencesKey: PreferenceKey {
    
    static var defaultValue: [TabBarItem] = []
    static func reduce(value : inout [TabBarItem],
                       nextValue: () ->[TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifeir: ViewModifier {
    let tab: TabBarItem
    @Binding var selection: TabBarItem

    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemPreferencesKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(tab: TabBarItem, slection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifeir(tab: tab, selection: slection))
    }
}

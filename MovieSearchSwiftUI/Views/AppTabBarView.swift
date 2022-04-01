import SwiftUI
import Combine

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
    }
}

struct AppTabBarView: View {
    
    @State private var selection: String = "Movies"
    @State private var tabSelection: TabBarItem = .movies
    
    var body: some View {
        
        CustomContainerTabBarView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: .movies, slection: $tabSelection)
            
            Color.red
                .tabBarItem(tab: .favourites, slection: $tabSelection)
            
            Color.purple
                .tabBarItem(tab: .profile, slection: $tabSelection)
            
            Color.orange
                .tabBarItem(tab: .settings, slection: $tabSelection)
        }
    }
}

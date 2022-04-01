import SwiftUI

enum TabBarItem: Hashable {
    case movies, favourites, profile, settings
    
    var iconName: String {
        switch self {
            case .movies: return "video"
            case .favourites: return "heart"
            case .profile: return "person"
            case .settings: return "gear"
        }
    }
    
    var title: String {
        switch self {
            case .movies: return "Movies"
            case .favourites: return "Favourites"
            case .profile: return "Profile"
            case .settings: return "Settings"
        }
    }
    
    var color: Color {
        switch self {
            case .movies: return .blue
            case .favourites: return .red
            case .profile: return .purple
            case .settings: return .orange
        }
    }
}

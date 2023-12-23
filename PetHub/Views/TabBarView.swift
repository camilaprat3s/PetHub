import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)

            SavedView()
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Saved")
                }
                .tag(2)

            ReservationsView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Reservations")
                }
                .tag(3)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}


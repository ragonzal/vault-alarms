//
//  TabBar.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationView {
                HomePage()
                    .navigationTitle("Safe Vaults")
            }
            .tabItem { Image(systemName: "house")
                Text("Home") }
            
            NavigationView {
                StatsPage()
                    .navigationTitle("Stats")
            }
            .tabItem {
                Image(systemName: "chart.bar")
                Text("Stats")
            }
            
            NavigationView {
                SettingsPage()
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

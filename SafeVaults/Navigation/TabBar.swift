//
//  TabBar.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct TabBar: View {
    var vaults = Vaults()
    
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
                    .navigationTitle("OSM Prices")
            }
            .tabItem {
                Image(systemName: "chart.bar")
                Text("Prices")
            }
            
            NavigationView {
                SettingsPage()
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        .environmentObject(vaults)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

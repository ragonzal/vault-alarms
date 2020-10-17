//
//  HomePage.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct HomePage: View {
    @State var items: [Vault] = vaults
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 159), spacing: 16)],
                spacing: 16) {
                VStack {
                    StatsCard(
                        token: "ETH-icon"
                    )
                    .frame(maxHeight: 300)
                }
                VStack {
                    StatsCard(
                        token: "WBTC-icon"
                    )
                    .frame(maxHeight: 300)
                }
            }
            .padding(16)
            
            SectionTitle(title: "Watchlist")
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 240), spacing: 16, alignment: .top)],
                spacing: 0) {
                ForEach(items) { item in
                    VaultRow(
                        token: "\(item.collateral)-icon",
                        name: item.name
                    )
                    .padding(.vertical, 6.0)
                }
            }
            .padding(16)
            
            AddButton()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomePage()
            HomePage()
                .preferredColorScheme(.dark)
        }
    }
}

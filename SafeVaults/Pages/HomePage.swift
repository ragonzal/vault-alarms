//
//  HomePage.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct HomePage: View {
    @State var items: [Vault] = vaults
    @State var selectedVault: Vault? = nil
    @State var show = false
    
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
                        name: item.name,
                        liquidationPrice: item.liquidationPrice,
                        ratio: item.ratio,
                        liquidationRatio: item.liquidationRatio
                    )
                    .onTapGesture {
                        self.selectedVault = item
                    }
                    .padding(.vertical, 6.0)
                }
                .sheet(
                    item: self.$selectedVault,
                    content: {selectedVault in
                        VaultDetailPage(vault: selectedVault)
                    }
                )
            }
            .padding(16)
            
            AddButton()
                .padding(.bottom, 50)
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

//
//  HomePage.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var vaults: Vaults
    
    @State var selectedVault: Vault? = nil
    @State var show = false
    
    @ViewBuilder
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color("Background 1")).edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 159), spacing: 16)],
                    spacing: 16) {
                    VStack {
                        StatsCard(
                            token: "ETH-icon",
                            currentPrice: 414.48,
                            nextPrice: 412.14
                        )
                        .frame(maxHeight: 300)
                    }
                    VStack {
                        StatsCard(
                            token: "WBTC-icon",
                            currentPrice: 13020.39,
                            nextPrice: 12883.13
                        )
                        .frame(maxHeight: 300)
                    }
                }
                .padding(16)
                
                SectionTitle(title: "Watchlist")
                if vaults.watchlist.isEmpty {
                    EmptyWatchlist()
                }else{
                    watchlist
                }
                
                NavigationLink(destination: AddVaultPage()) {
                    AddButton()
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, 50)
                
            }
        }
    }
    
    var watchlist: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 240), spacing: 16, alignment: .top)],
            spacing: 0) {
            ForEach(vaults.watchlist) { item in
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
                .padding(.vertical, 1.0)
            }
            .sheet(
                item: self.$selectedVault,
                content: {selectedVault in
                    VaultDetailPage(vault: selectedVault)
                }
            )
        }
        .padding(16)
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



//
//  StatsPage.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct StatsPage: View {
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
                    
                    VStack {
                        StatsCard(
                            token: "BAT-icon",
                            currentPrice: 0.2215,
                            nextPrice: 0.2215
                        )
                        .frame(maxHeight: 300)
                    }
                    
                    VStack {
                        StatsCard(
                            token: "KNC-icon",
                            currentPrice: 0.9379,
                            nextPrice: 0.9284
                        )
                        .frame(maxHeight: 300)
                    }
                    
                    VStack {
                        StatsCard(
                            token: "ZRX-icon",
                            currentPrice: 0.3814,
                            nextPrice: 0.3814
                        )
                        .frame(maxHeight: 300)
                    }
                    
                    VStack {
                        StatsCard(
                            token: "MANA-icon",
                            currentPrice: 0.0759,
                            nextPrice: 0.0749
                        )
                        .frame(maxHeight: 300)
                    }
                    
                    VStack {
                        StatsCard(
                            token: "USDC-icon",
                            currentPrice: 1.00,
                            nextPrice: 1.00
                        )
                        .frame(maxHeight: 300)
                    }
                    
                    VStack {
                        StatsCard(
                            token: "LINK-icon",
                            currentPrice: 11.9473,
                            nextPrice: 11.80812
                        )
                        .frame(maxHeight: 300)
                    }
                    
                    VStack {
                        StatsCard(
                            token: "COMP-icon",
                            currentPrice: 101.28838,
                            nextPrice: 99.7694
                        )
                        .frame(maxHeight: 300)
                    }
                }
                .padding(16)
            }
        }
    }
}

struct StatsPage_Previews: PreviewProvider {
    static var previews: some View {
        StatsPage()
    }
}

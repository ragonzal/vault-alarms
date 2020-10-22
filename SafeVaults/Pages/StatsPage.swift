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
                    
                    VStack {
                        StatsCard(
                            token: "COMP-icon"
                        )
                        .frame(maxHeight: 300)
                    }
                    
                    VStack {
                        StatsCard(
                            token: "ZRX-icon"
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

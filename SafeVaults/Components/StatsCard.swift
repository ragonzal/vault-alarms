//
//  StatsCard.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct StatsCard: View {
    var token: String = "ETH-icon"
    var currentPrice: CGFloat = 368.00
    var nextPrice: CGFloat = 367.19
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            HStack {
                TokenLogo(
                    token: token, size: 50
                )
                Spacer()
                Text("$ \(currentPrice, specifier: "%.2f")")
                    .font(.title3)
                    .bold()
            }
            HStack {
                Spacer()
                Text("Next: $ \(nextPrice, specifier: "%.2f")")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding(5.0)
            Spacer()
        }
        .padding(16)
        .background(Color("Background 2"))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct StatsCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatsCard()
                .previewLayout(.fixed(width: 200, height: 200))
            StatsCard()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 200, height: 200))
        }
    }
}
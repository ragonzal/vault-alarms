//
//  StatsCard.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct StatsCard: View {
    var token: String = "ETH-icon"
    var currentPrice: CGFloat = 0
    var nextPrice: CGFloat = 0
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .center, spacing: 4.0) {
                Spacer()
                TokenLogo(
                    token: token, size: 50
                )
                Text("$ \(currentPrice, specifier: "%.2f")")
                    .font(.title3)
                    .bold()
                    .padding(.top, 3.0)
                    
                Spacer()
                Text("Next: $ \(nextPrice, specifier: "%.2f")")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            Spacer()
        }
        .padding(16)
        .background(Color("Background 2"))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
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

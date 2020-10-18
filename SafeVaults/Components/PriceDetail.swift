//
//  PriceDetail.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct PriceDetail: View {
    var currentPrice: CGFloat
    var nextPrice: CGFloat
    var liquidationPrice: CGFloat
    
    func getVariationImage() -> String {
        if (self.nextPrice > self.currentPrice) {
            return "arrowtriangle.up.fill"
        } else if (self.nextPrice < self.currentPrice) {
            return "arrowtriangle.down.fill"
        }
        return "equal"
    }
    
    func getVariationImageColor() -> Color {
        if (self.nextPrice > self.currentPrice) {
            return Color.green
        } else if (self.nextPrice < self.currentPrice) {
            return Color.red
        }
        return Color.yellow
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 50) {
            VStack(alignment: .leading, spacing: 1) {
                Text("Current Price")
                    .font(.callout)
                Text("$\(currentPrice, specifier: "%.2f")")
                    .font(.title)
                HStack {
                    Text("Next:")
                        .font(.callout)
                    Image(systemName: self.getVariationImage())
                        .foregroundColor(self.getVariationImageColor())
                    Text("$\(nextPrice, specifier: "%.2f")")
                        .font(.callout)
                }
            }
            VStack(alignment: .leading, spacing: 1) {
                Text("Liquidation Price")
                    .font(.callout)
                Text("$\(liquidationPrice, specifier: "%.2f")")
                    .font(.title)
            }
        }
    }
}

struct PriceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PriceDetail(
            currentPrice: 367.19,
            nextPrice: 356.00,
            liquidationPrice: 275.45
        )
        .previewLayout(.fixed(width: 320, height: 100))
        
        PriceDetail(
            currentPrice: 367.19,
            nextPrice: 386.00,
            liquidationPrice: 275.45
        )
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 320, height: 100))
        
        PriceDetail(
            currentPrice: 386.00,
            nextPrice: 386.00,
            liquidationPrice: 275.45
        )
        .previewLayout(.fixed(width: 320, height: 100))
    }
}

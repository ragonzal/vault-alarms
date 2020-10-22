//
//  VaultRow.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct VaultRow: View {
    var token: String
    var name: String
    var liquidationPrice: CGFloat
    var ratio: CGFloat
    var liquidationRatio: CGFloat
    
    func getRatioColor() -> Color {
        if (self.ratio/self.liquidationRatio < 1) {
            return Color.red
        }
        if (self.ratio/self.liquidationRatio < 1.25) {
            return Color.yellow
        }
        return Color.green
    }
    
    var body: some View {
        HStack {
            HStack(alignment: .top) {
                TokenLogo(
                    token: token, size: 38.0
                )
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(name)
                        .font(.subheadline)
                        .bold()
                    Text("Liq. price: $\(liquidationPrice, specifier: "%.2f")")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            Text("\(ratio, specifier: "%.2f")%")
                .font(.subheadline)
                .bold()
                .foregroundColor(self.getRatioColor())
        }
        .padding()
        .background(Color("Background 2"))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct VaultRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VaultRow(
                token: "ETH-icon",
                name: "Test Vault",
                liquidationPrice: 288,
                ratio: 201,
                liquidationRatio: 150
            )
                .previewLayout(.fixed(width: 300, height: 70))
            VaultRow(
                token: "ETH-icon",
                name: "Test Vault",
                liquidationPrice: 288,
                ratio: 201,
                liquidationRatio: 150
            )
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}

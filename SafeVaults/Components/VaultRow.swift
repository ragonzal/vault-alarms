//
//  VaultRow.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct VaultRow: View {
    var token: String = "ETH-icon"
    var name: String = "My vault"
    var liquidationPrice: CGFloat = 100.00
    var ratio: CGFloat = 180.00
    var liquidationRatio: CGFloat = 150.00
    
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
                .if(ratio/liquidationRatio < 1){ view in
                    view.foregroundColor(Color.red)
                }
                .if(ratio/liquidationRatio < 1.25){ view in
                    view.foregroundColor(Color.yellow)
                }
                .if(ratio/liquidationRatio >= 1.25){ view in
                    view.foregroundColor(Color.green)
                }
        }
        .padding()
        .background(Color("Background 2"))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
}

struct VaultRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VaultRow()
                .previewLayout(.fixed(width: 300, height: 70))
            VaultRow()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}

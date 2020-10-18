//
//  VaultDetailPage.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct VaultDetailPage: View {
    @Environment(\.presentationMode) var presentationMode
    var vault: Vault
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            content
                .navigationTitle(vault.name)
                .navigationBarTitleDisplayMode(.inline)
            
            CloseButton()
                .padding(20)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
    
    var content: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    TokenLogo(
                        token: "\(vault.collateral)-icon"
                    )
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(vault.name)
                        .font(.title3).bold()
                        .foregroundColor(.white)
                    Text("# \(vault.number) - \(vault.userAddress)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(0.8)
                }
            }
            .padding(.all, 20)
            .background(
                Image("Livestream 1")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            
            stats
        }
    }
    
    var stats: some View {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .center) {
                PriceDetail(
                    currentPrice: vault.collateralPrice,
                    nextPrice: vault.collateralNextPrice,
                    liquidationPrice: vault.liquidationPrice
                )
                Divider()
            }
            RatioDetail(
                limit: vault.liquidationRatio,
                ratio: vault.ratio
            )
            Divider()
            DetailedAmount(
                title: "Collateral",
                amount: vault.collateralAmount,
                sign: vault.collateral
            )
            Divider()
            DetailedAmount(
                title: "Debt",
                amount: vault.debtAmount,
                sign: "DAI"
            )
        }
        .padding()
    }
}

struct VaultDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        VaultDetailPage(vault: vaults[0])
        VaultDetailPage(vault: vaults[0])
            .preferredColorScheme(.dark)
    }
}
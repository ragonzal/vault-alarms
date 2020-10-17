//
//  TokenLogo.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct TokenLogo: View {
    var token: String = "ETH-icon"
    var size: CGFloat = 50.0
    
    var body: some View {
            Image(token)
                .resizable()
                .frame(width: size, height: size)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct TokenLogo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TokenLogo(
                token: "DAI-icon", size: 50
            )
            .previewLayout(.fixed(width: 300, height: 70))
            TokenLogo(
                token: "WBTC-icon", size: 32
            )
            .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}

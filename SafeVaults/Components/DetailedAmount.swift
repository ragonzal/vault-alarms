//
//  DetailedAmount.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct DetailedAmount: View {
    var title: String
    var amount: CGFloat
    var sign: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.callout)
            HStack(alignment: .bottom) {
                Text("\(amount, specifier: "%.2f")")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(sign)
                    .font(.footnote)
                    .padding(.bottom, 7.0)
            }
        }
    }
}

struct DetailedAmount_Previews: PreviewProvider {
    static var previews: some View {
        DetailedAmount(
            title: "Collateral",
            amount: 1000.00,
            sign: "ETH"
        )
        .previewLayout(.fixed(width: 300, height: 100))
        
        DetailedAmount(
            title: "Collateral",
            amount: 200.00,
            sign: "ETH"
        )
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 300, height: 100))
    }
}

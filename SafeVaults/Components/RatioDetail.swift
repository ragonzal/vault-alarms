//
//  RatioDetail.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct RatioDetail: View {
    var limit: CGFloat
    var ratio: CGFloat
    
    func getRatioColor() -> Color {
        if (self.ratio/self.limit < 1) {
            return Color.red
        }
        if (self.ratio/self.limit < 1.25) {
            return Color.yellow
        }
        return Color.green
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Circle()
                    .fill(self.getRatioColor())
                    .frame(width: 10, height: 10)
                
                Text("Ratio (Min: \(limit, specifier: "%.2f")%)")
                    .font(.callout)
            }
            Text("\(ratio, specifier: "%.2f")%")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

struct RatioDetail_Previews: PreviewProvider {
    static var previews: some View {
        RatioDetail(
            limit: 100.00,
            ratio: 120.00
        )
        .previewLayout(.fixed(width: 300, height: 100))
        
        RatioDetail(
            limit: 10.00,
            ratio: 120.00
        )
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 300, height: 100))
    }
}

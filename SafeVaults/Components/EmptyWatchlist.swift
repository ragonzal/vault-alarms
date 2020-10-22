//
//  EmptyWatchlist.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 22/10/2020.
//

import SwiftUI

struct EmptyWatchlist: View {
    var body: some View {
        Text("Empty watchlist")
            .font(.title)
            .italic()
            .fontWeight(.light)
            .foregroundColor(Color.gray)
            .multilineTextAlignment(.center)
            .padding(.vertical, 100.0)
    }
}

struct EmptyWatchlist_Previews: PreviewProvider {
    static var previews: some View {
        EmptyWatchlist()
            .previewLayout(.fixed(width: 300, height: 200))
        EmptyWatchlist()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 300, height: 200))
    }
}

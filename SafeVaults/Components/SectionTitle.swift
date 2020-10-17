//
//  SectionTitle.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct SectionTitle: View {
    var title = "Title"
    var body: some View {
        HStack {
            Text(title).bold()
                .padding(.horizontal)
                .padding(.top, 16)
            Spacer()
        }
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle()
    }
}

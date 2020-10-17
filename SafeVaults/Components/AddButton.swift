//
//  AddButton.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        HStack {
            Image(systemName: "plus")
            Text("Add Vault")
        }
        .padding(.vertical, 5.0)
        .padding(.horizontal, 25.0)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color("Border"), lineWidth: 1)
        )
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddButton()
                .previewLayout(.fixed(width: 300, height: 70))
            AddButton()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}

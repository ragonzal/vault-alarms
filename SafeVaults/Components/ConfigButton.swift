//
//  ConfigButton.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 22/10/2020.
//

import SwiftUI

struct ConfigButton: View {
    var body: some View {
        Image(systemName: "gearshape")
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(Color.black.opacity(0.6))
            .mask(Circle())
    }
}

struct ConfigButton_Previews: PreviewProvider {
    static var previews: some View {
        ConfigButton()
    }
}

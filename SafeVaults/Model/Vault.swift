//
//  Vault.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

struct Vault: Identifiable {
    var id = UUID()
    var name: String
    var collateral: String
}


var vaults = [
    Vault(
        name: "My main vault",
        collateral: "ETH"
    ),
    Vault(
        name: "Bitcoin vault",
        collateral: "WBTC"
    ),
    Vault(
        name: "Another one",
        collateral: "ZRX"
    ),
    Vault(
        name: "COMP Vault",
        collateral: "COMP"
    )
]

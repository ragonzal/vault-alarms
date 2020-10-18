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
    var number: Int
    var userAddress: String
    
    var liquidationPrice: CGFloat
    var liquidationRatio: CGFloat
    var ratio: CGFloat
    
    var collateralAmount: CGFloat
    var debtAmount: CGFloat
    
    var collateralPrice: CGFloat
    var collateralNextPrice: CGFloat
}


var vaults = [
    Vault(
        name: "My main vault",
        collateral: "ETH",
        number: 12315,
        userAddress: "0xC55...f19",
        liquidationPrice: 200,
        liquidationRatio: 150.0,
        ratio: 284,
        collateralAmount: 20000,
        debtAmount: 400000,
        collateralPrice: 367.59,
        collateralNextPrice: 390.01
    ),
    Vault(
        name: "Bitcoin vault",
        collateral: "WBTC",
        number: 12315,
        userAddress: "0xC55...f19",
        liquidationPrice: 250,
        liquidationRatio: 150.0,
        ratio: 220,
        collateralAmount: 234,
        debtAmount: 100123,
        collateralPrice: 11390.01,
        collateralNextPrice: 11394.34
    ),
    Vault(
        name: "Another one",
        collateral: "USDC",
        number: 12315,
        userAddress: "0xC55...f19",
        liquidationPrice: 1.02,
        liquidationRatio: 100,
        ratio: 99,
        collateralAmount: 130000,
        debtAmount: 13141,
        collateralPrice: 1.00,
        collateralNextPrice: 1.00
    ),
    Vault(
        name: "COMP Vault",
        collateral: "COMP",
        number: 12315,
        userAddress: "0xC55...f19",
        liquidationPrice: 102,
        liquidationRatio: 125,
        ratio: 150,
        collateralAmount: 54312,
        debtAmount: 12314,
        collateralPrice: 104.90,
        collateralNextPrice: 104.86
    )
]

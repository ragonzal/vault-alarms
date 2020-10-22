//
//  Helpers.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 21/10/2020.
//

import SwiftUI

struct VaultResponse: Codable  {
    let subscribed: Bool
    let _id: String
    let urn: String
    let owner: String
    let collateral: CGFloat
    let debt: String
    let type: String
    let cdpId: String
    let userAddr: String
    let __v: Int
    let ratio: String
    let liqPrice: String
    let liqRatio: CGFloat
    let collateralUSD:  CGFloat
    let currentExchangePrice:  CGFloat
    let collateralprice:  CGFloat
    let valueImpored:  CGFloat
    let valueExpored:  CGFloat
    let cdpBalance:  CGFloat
    let profit:  CGFloat
}

//
//  API.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 22/10/2020.
//

import SwiftUI

func fetchVault(vaultId: String, vaults: Vaults) {
    let path = "https://defiexplore.com/api/cdps/\(vaultId)"
    
    guard let url = URL(string: path) else {
        print("Invalid URL")
        return
    }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let decodedResponse = try? JSONDecoder().decode(VaultResponse.self, from: data) {
                // we have good data – go back to the main thread
                DispatchQueue.main.async {
                    let newVault = Vault()
                    newVault.name = "Vault #\(vaultId)"
                    newVault.collateral = decodedResponse.type
                    newVault.number = Int(decodedResponse.cdpId) ?? 0
                    newVault.userAddress = decodedResponse.userAddr
                    newVault.liquidationPrice = CGFloat((decodedResponse.liqPrice as NSString).floatValue)
                    newVault.liquidationRatio = decodedResponse.liqRatio * 100
                    newVault.ratio = CGFloat((decodedResponse.ratio as NSString).floatValue) * 100
                    newVault.collateralAmount = decodedResponse.collateral
                    newVault.debtAmount = CGFloat((decodedResponse.debt as NSString).floatValue)
                    newVault.collateralPrice = decodedResponse.collateralprice
                    vaults.add(newVault)
                }
                
                // everything is good, so we can exit
                return
            }
        }
        
        // if we're still here it means there was a problem
        print("Fetch failed: \(String(describing: error))")
    }.resume()
    
}

func updateVault(vault: Vault, vaults: Vaults) {
    let path = "https://defiexplore.com/api/cdps/\(String(vault.number))"
    
    guard let url = URL(string: path) else {
        print("Invalid URL")
        return
    }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let decodedResponse = try? JSONDecoder().decode(VaultResponse.self, from: data) {
                // we have good data – go back to the main thread
                DispatchQueue.main.async {
                    vault.liquidationPrice = CGFloat((decodedResponse.liqPrice as NSString).floatValue)
                    vault.liquidationRatio = decodedResponse.liqRatio * 100
                    vault.ratio = CGFloat((decodedResponse.ratio as NSString).floatValue) * 100
                    vault.collateralAmount = decodedResponse.collateral
                    vault.debtAmount = CGFloat((decodedResponse.debt as NSString).floatValue)
                    vault.collateralPrice = decodedResponse.collateralprice
                    vaults.save()
                    vaults.reloadData()
                }
                
                // everything is good, so we can exit
                return
            }
        }
        
        // if we're still here it means there was a problem
        print("Fetch failed: \(String(describing: error))")
    }.resume()
    
}

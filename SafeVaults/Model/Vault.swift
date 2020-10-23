//
//  Vault.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 17/10/2020.
//

import SwiftUI

class Vault: Identifiable, Codable {
    var id = UUID()
    var name: String = "Name"
    var collateral: String = "ETH"
    var number: Int = 0
    var userAddress: String = "0x"
    
    var liquidationPrice: CGFloat = 0.0
    var liquidationRatio: CGFloat = 0.0
    var ratio: CGFloat = 0.0
    
    var collateralAmount: CGFloat = 0.0
    var debtAmount: CGFloat = 0.0
    
    var collateralPrice: CGFloat = 0.0
    var collateralNextPrice: CGFloat = 0.0
    
    var activeAlert: Bool = true
    
    func shortUserAddress() -> String {
        if self.userAddress.count < 10 {
            return self.userAddress
        }
        return "\(self.userAddress.prefix(5))...\(self.userAddress.suffix(3))"
    }
}

class Vaults: ObservableObject {
    @Published private(set) var watchlist: [Vault]
    static let saveKey = "SavedWatchlist"
    static let suitName = "group.com.rg.SafeVaults"
    
    init() {
        print("Vaults initiated!")
        if let userDefaults = UserDefaults(suiteName: Self.suitName) {
            if let data = userDefaults.data(forKey: Self.saveKey) {
                if let decoded = try? JSONDecoder().decode([Vault].self, from: data) {
                    self.watchlist = decoded
                    self.refreshData()
                    return
                }
            }
        }
        
        
        self.watchlist = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(watchlist) {
            if let userDefaults = UserDefaults(suiteName: Self.suitName) {
                userDefaults.set(encoded, forKey: Self.saveKey)
            }
        }
    }
    
    func add(_ vault: Vault) {
        watchlist.append(vault)
        save()
    }
    
    func remove(vault: Vault) {
        let newWatchlist = watchlist.filter{$0.id != vault.id}
        watchlist = newWatchlist
        save()
    }
    
    func refreshData() {
        for vault in self.watchlist {
            print("Refetching!")
            updateVault(vault: vault, vaults: self)
        }
        save()
    }
    
    func reloadData() {
        if let userDefaults = UserDefaults(suiteName: Self.suitName) {
            if let data = userDefaults.data(forKey: Self.saveKey) {
                if let decoded = try? JSONDecoder().decode([Vault].self, from: data) {
                    self.watchlist = decoded
                    return
                }
            }
        }
    }
    
}

var vaults: [Vault] = []

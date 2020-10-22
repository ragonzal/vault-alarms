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
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Vault].self, from: data) {
                self.watchlist = decoded
                return
            }
        }
        
        self.watchlist = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(watchlist) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    func add(_ vault: Vault) {
        watchlist.append(vault)
        save()
    }
    
    func remove(vault: Vault) {
        print("Watchlist length: \(watchlist.count)")
        let newWatchlist = watchlist.filter{$0.id != vault.id}
        print("newWatchlist length: \(newWatchlist.count)")
        watchlist = newWatchlist
        save()
    }
    
}

var vaults: [Vault] = []

//
//  AddVaultPage.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 21/10/2020.
//

import SwiftUI


struct AddVaultPage: View {
    @EnvironmentObject var vaults: Vaults
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var userInput: String = ""
    @State private var inProcess = false

    var body: some View {
        
        ZStack {
            Rectangle().foregroundColor(Color("Background 1")).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("Input an Ethereum address, ENS")
                    Text("or the Vault ID to get started")
                }
                .padding(.vertical)
                VStack {
                    TextField("Address, ENS or Vault ID", text: $userInput)
                    Divider()
                }
                .padding(40.0)
                Button("Add Vault") {
                    fetchVault()
                    self.presentationMode.wrappedValue.dismiss()
                }
                .disabled(inProcess)
                Spacer()
            }
        }
    }
    
    func fetchVault() {
        let path = "https://defiexplore.com/api/cdps/\(String(self.userInput))"

        
        guard let url = URL(string: path) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        inProcess = true
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(VaultResponse.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        let newVault = Vault()
                        newVault.name = "Vault #\(self.userInput)"
                        newVault.collateral = decodedResponse.type
                        newVault.number = Int(decodedResponse.cdpId) ?? 0
                        newVault.userAddress = decodedResponse.userAddr
                        newVault.liquidationPrice = CGFloat((decodedResponse.liqPrice as NSString).floatValue)
                        newVault.liquidationRatio = decodedResponse.liqRatio * 100
                        newVault.ratio = CGFloat((decodedResponse.ratio as NSString).floatValue) * 100
                        newVault.collateralAmount = decodedResponse.collateral
                        newVault.debtAmount = CGFloat((decodedResponse.debt as NSString).floatValue)
                        newVault.collateralPrice = decodedResponse.collateralprice
                        self.vaults.add(newVault)
                    }
                    
                    // everything is good, so we can exit
                    self.inProcess = false
                    return
                }
            }
            
            // if we're still here it means there was a problem
            print("Fetch failed: \(String(describing: error))")
            inProcess = false
        }.resume()
        
    }
}

struct AddVaultPage_Previews: PreviewProvider {
    static var previews: some View {
        AddVaultPage()
    }
}

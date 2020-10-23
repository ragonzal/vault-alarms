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
                    inProcess.toggle()
                    fetchVault(vaultId: self.userInput, vaults: vaults)
                    self.presentationMode.wrappedValue.dismiss()
                }
                .disabled(inProcess)
                Spacer()
            }
        }
    }
}

struct AddVaultPage_Previews: PreviewProvider {
    static var previews: some View {
        AddVaultPage()
    }
}

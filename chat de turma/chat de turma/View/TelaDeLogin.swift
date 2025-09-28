//
//  TelaDeLogin.swift
//  chat de turma
//
//  Created by user on 23/09/25.
//

import SwiftUI

struct TelaDeLogin: View {
    @State var nome:String = ""
    @State var senha:String = ""
    @State var pantryID:String = ""
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
            // Logo (to-do, fazer o logo)
            RoundedRectangle(cornerRadius:20)
                .frame(height: 250)
                .padding(.horizontal, 30)
                .overlay{
                    Text("Logo.png")
                        .foregroundStyle(Color.white)
                }
            
            // Lista de inputs
            List {
                VStack(alignment: .leading) {
                    Text("Nome:")
                        .font(.subheadline)
                    
                    TextField("Escreva Aqui", text: $nome)
                }
                
                VStack(alignment: .leading) {
                    Text("Senha:")
                        .font(.subheadline)
                    
                    TextField("Escreva Aqui", text: $senha)
                }
                
                VStack(alignment: .leading) {
                    Text("PantryID:")
                        .font(.subheadline)
                    
                    TextField("Escreva Aqui", text: $pantryID)
                }
           }
            .frame(height: 300)
            .scrollContentBackground(Visibility.hidden)
            
            // Botões
            Button(
                action: {
                    UserDefaults.standard.setValue(pantryID, forKey: "PantryID")
                    
                    // Remover depois!
                    print("PantryID: \(UserDefaults.standard.string(forKey: "PantryID")!)")
                    
                    PantryServiceTest.Test1()
                    // Remover depois!
                    
                },
                label: {
                    RoundedRectangle(cornerRadius: 67.69)
                        .frame(height:35.69)
                        .foregroundStyle(Color.blue)
                        .padding(.horizontal,67)
                        .overlay{
                            Text("Entrar")
                                .foregroundStyle(Color.white)
                        }
                }
            )
            
            NavigationLink {
                TelaDeRegistracao()
            } label: {
                RoundedRectangle(cornerRadius: 67.69)
                    .frame(height:35.69)
                    .foregroundStyle(Color.red)
                    .padding(.horizontal,67)
                    .overlay{
                        Text("Cadastrar-se")
                            .foregroundStyle(Color.white)
                    }
            }
        }
        
    }
}

#Preview {
    VStack {
        NavigationStack {
            TelaDeLogin()
        }
    }
}

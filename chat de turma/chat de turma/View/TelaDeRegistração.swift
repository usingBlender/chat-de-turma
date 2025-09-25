//
//  TelaDeRegistração.swift
//  chat de turma
//
//  Created by user on 24/09/25.
//

import SwiftUI

struct TelaDeRegistracao: View {
    @State var nome:String = ""
    @State var senha:String = ""
    @State var email:String = ""
    @State var tipo:tipoDeConta = .aluno
    @State var codigo:String = ""
    
    var body: some View {
        VStack {
            List {
                // Entradas de Texto Iniciais
                VStack {
                    Text("Nome")
                        .font(.system(size: 16, weight: .bold))
                    
                    TextField("Escreva Aqui", text: $nome)
                }
                
                VStack {
                    Text("Email")
                        .font(.system(size: 16, weight: .bold))
                    
                    TextField("Escreva Aqui", text: $email)
                }
                
                VStack {
                    Text("Senha")
                        .font(.system(size: 16, weight: .bold))
                    
                    TextField("Escreva Aqui", text: $senha)
                }
                
                // Picker
                VStack(spacing: 20) {
                    Text("Acesso")
                        .font(.system(size: 16, weight: .bold))
                    
                    Picker("Tipo de Conta", selection: $tipo) {
                        Text("Aluno").tag(tipoDeConta.aluno)
                        Text("Professor").tag(tipoDeConta.professor)
                    }
                    
                    if tipo == .aluno {
                        HStack {
                            Text("Codigo de Turma:")
                            
                            TextField("Escreva Aqui", text: $codigo)
                        }
                    }
                }
            }
            // Fim de Lista
            
            .navigationTitle("Registrar Conta")
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: {
                            print("skibidi causa")
                        },
                        label: {
                            Text("Cadastrar")
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    VStack {
        TelaDeRegistracao()
    }
}

//
//  TelaForum.swift
//  chat de turma
//
//  Created by user on 09/10/25.
//

import SwiftUI

struct TelaForum: View {
    @State var mensagensPreset:[Mensagem] = [
        Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: "Ei galera, e o conteudo, como fica?", tipo: .mensagem)),
        
        Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: "skibidi toilet", tipo: .imagem)),
        
        Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: "skibidi sigma", tipo: .arquivo)),
        
        Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: "Tá aí irmão, tmj", tipo: .mensagem))
    ]
    
    @State var isEnviarSheetOpen:Bool = false
    @State var isArquivo:Bool = false
    
    @State var mensagemTexto:String = ""
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    ForEach(mensagensPreset) { mensagem in
                        mensagemView(mensagem: mensagem)
                    }
                }
            }
            .defaultScrollAnchor(.bottom)
            .navigationTitle("Turma")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: {
                            isEnviarSheetOpen.toggle()
                        },
                        label: {
                            Text("Enviar")
                        })
                }
            }
            
            // SHEET
            .sheet(isPresented: $isEnviarSheetOpen) {
                VStack() {
                    ZStack {
                        HStack {
                            Spacer()
                            
                            CloserButton()
                        }
                        
                        Text("Titulo")
                            .font(.system(size: 17, weight: .bold))
                    } .padding(.vertical, 10)
                    
                    HStack() {
                        Text("Arquivo:")
                            .font(.system(size: 17, weight: .bold))
                        
                        Spacer()
                        
                        Toggle(isOn: $isArquivo, label: {})
                            .tint(Color.blue)
                    } .padding(.horizontal)
                    
                    if isArquivo {
                        HStack {
                            ZStack {
                                Image(systemName: "doc.fill")
                                    .font(.system(size: 100))
                                    .foregroundStyle(.gray.opacity(0.3))
                                
                                Text("PREVIEW")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundStyle(.gray)
                            }
                            
                            Button(
                                action: {
                                    print("Selecionar Arquivo Não Implementado")
                                },
                                label: {
                                    Text("Selecionar Arquivo")
                                        .frame(width: 100)
                                }
                            )
                        } .padding()
                    } else {
                        TextField("Escreva Aqui!", text: $mensagemTexto, axis: .vertical)
                            .padding(5)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.leading)
                            .lineLimit(6, reservesSpace: true)
                            .background {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(.gray.opacity(0.3))
                            }
                            .padding(5)
                    }
                    
                    Button(
                        action: {
                            if isArquivo {
                                mensagensPreset.append(
                                    Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: "", tipo: .arquivo))
                                )
                            } else {
                                mensagensPreset.append(
                                    Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: mensagemTexto, tipo: .mensagem))
                                )
                            }
                        },
                        label: {
                            RoundedRectangle(cornerRadius: 30)
                                .padding(.horizontal)
                                .overlay {
                                    HStack {
                                        Text("Enviar")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold))
                                            .padding(.horizontal)
                                        
                                        Image(systemName: "doc.badge.arrow.up.fill")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 40))
                                    }
                                }
                                .frame(height: 70)
                        }
                    )
                    
                    Spacer()
                }
                .presentationDetents([.height(360)])
                .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    TelaForum()
}

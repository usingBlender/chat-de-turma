//
//  TelaForum.swift
//  chat de turma
//
//  Created by user on 09/10/25.
//

import SwiftUI

struct TelaChat: View {
    @State var mensagensPreset:[Mensagem] = [
        Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: "Ei galera, e o conteudo, como fica?", tipo: .mensagem)),
        
        Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: "Sei não pae", tipo: .mensagem))
    ]
    
    @State var isEnviarSheetOpen:Bool = false
    @State var isArquivo:Bool = false
    
    @State var mensagemTexto:String = ""
    
    var body: some View {
        NavigationView {
            ZStack() {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(mensagensPreset) { mensagem in
                            mensagemView(mensagem: mensagem)
                        }
                        
                        Spacer()
                            .frame(height: 85)
                    }
                } .zIndex(1)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        TextField("", text: $mensagemTexto, prompt: Text("Escreva Aqui!").foregroundStyle(Color.black.opacity(0.7)), axis: .vertical)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1...5)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Button(
                            action: {
                                mensagensPreset.append(Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: mensagemTexto, tipo: .mensagem)))
                                
                                mensagemTexto = ""
                            },
                            label: {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .overlay {
                                        Image(systemName: "arrowshape.right.fill")
                                            .foregroundStyle(Color.white)
                                    }
                            }
                        )
                    }
                    .padding(5)
                    .background {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(Color.blue)
                                .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 30)))
                        }
                    .padding()
                }
                .zIndex(2)
            }
            .defaultScrollAnchor(.bottom)
            .navigationTitle("Chat do Professor")
        }
    }
}

#Preview {
    TelaChat()
}

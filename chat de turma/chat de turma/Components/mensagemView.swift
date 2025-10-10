//
//  mensagem.swift
//  chat de turma
//
//  Created by user on 09/10/25.
//

import SwiftUI

struct mensagemView: View {
    var mensagem:Mensagem
    
    @ViewBuilder var conteudo:some View {
        switch mensagem.conteudo.tipo {
        case .arquivo:
            ZStack {
                HStack { // isso aqui não é funcional nem se trocar nada aq, trocar por algo funcional no futuro
                    Image(systemName: "arrow.down.doc")
                        .font(.system(size: 40))
                    
                    VStack(alignment: .leading) {
                        Text("File Name Placeholder")
                            .font(.system(size: 17, weight: .bold))
                        Text("700.3 TB")
                    }
                    
                    Spacer()
                } .padding()
            }
        case .imagem:
            ZStack {
                Image("default") // trocar pelo bregueço da imagem
                    .resizable()
                    .aspectRatio(1.5, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .foregroundStyle(.clear)
            }
        case .mensagem:
            ZStack {
                let conteudo:String? = mensagem.conteudo.conteudo as? String
                
                if let conteudo = conteudo {
                    HStack {
                        Text(conteudo)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.white)
                    .overlay {
                        Image(systemName: "person.fill")
                            .font(.system(size: 50))
                            .padding(.top)
                            .clipShape(Circle())
                            .foregroundStyle(.black)
                    }
                
                Text("Nome")
                    .font(.system(size: 20, weight: .medium))
                
                Spacer()
                
                Text("04:20")
                    .font(.system(size: 17, weight: .medium))
                    .padding(.horizontal)
            }
            
            conteudo
                .background {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.white)
                }
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 40)
                .foregroundStyle(.gray.opacity(0.3))
        }
        .padding(10)
    }
}

#Preview {
    mensagemView(mensagem: .init(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: "teste", tipo: .mensagem)))
}

//
//  TelaForum.swift
//  chat de turma
//
//  Created by user on 09/10/25.
//

import SwiftUI

struct TelaCanal: View {
    @State var mensagensPreset:[Mensagem] = [
        Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: "Boa tarde turma, aqui segue o PDF do proximo trabalho!", tipo: .mensagem)),
        
        Mensagem(mensagemID: .init(), usuarioID: .init(), conteudo: .init(conteudo: "", tipo: .arquivo)),
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
            .navigationTitle("Canal do Professor")
        }
    }
}

#Preview {
    TelaCanal()
}

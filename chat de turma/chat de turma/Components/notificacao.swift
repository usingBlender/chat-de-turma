//
//  notificacao.swift
//  chat de turma
//
//  Created by user on 25/09/25.
//

import SwiftUI

enum TipoDeNotificacao:String {
    case forum = "Fórum"
    case direto = "Chat Direto"
    case canal = "Canal"
}

struct Notificacao: View {
    let icone:String
    let tipo:TipoDeNotificacao
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 100)
                .padding(.horizontal)
                .foregroundStyle(Color.gray.opacity(0.3))
            
            HStack {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: icone)
                        .font(.system(size: 50))
                    
                    ZStack {
                        Circle()
                            .frame(width: 20)
                            .foregroundStyle(.red)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("")
                }
            }
            .padding(.horizontal, 40)
        }
    }
}

#Preview {
    Notificacao(icone: "person.circle.fill", tipo: .canal)
}

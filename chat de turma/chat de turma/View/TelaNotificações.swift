//
//  TelaNotificações.swift
//  chat de turma
//
//  Created by user on 25/09/25.
//

import SwiftUI

struct TelaNotificacoes: View {
    var body: some View {
        VStack {
            Text("Noticias")
                .font(.system(size: 20, weight: .bold))
                .padding(.top)
            
            Rectangle()
                .frame(height: 2)
                .padding(.horizontal)
                .padding(.bottom)
            
            ScrollView(.vertical) {
                VStack {
                    Notificacao(tipo: .canal, quantia: 3)
                    
                    Notificacao(tipo: .direto, quantia: 47)
                    
                    Notificacao(tipo: .forum, quantia: 39)
                }
            }
        }
    }
}

#Preview {
    TelaNotificacoes()
}

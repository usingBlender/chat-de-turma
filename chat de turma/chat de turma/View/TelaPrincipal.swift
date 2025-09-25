//
//  TelaPrincipal.swift
//  chat de turma
//
//  Created by user on 24/09/25.
//

import SwiftUI

enum tabDeTelas:String {
    case main, canal, chat, forum
}

struct TelaPrincipal: View {
    @State var tabSelecionada:tabDeTelas = .main
    
    var body: some View {
        TabView {
            TelaDeRegistracao()
                .tag(0)
                .tabItem {
                    Label("Main", systemImage: "square.fill")
                }
            
            TelaDeLogin()
                .tag(1)
                .tabItem {
                    Label("Secundaria", systemImage: "circle.fill")
                }
         }
    }
}

#Preview {
    TelaPrincipal()
}

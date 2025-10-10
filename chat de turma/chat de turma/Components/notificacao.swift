//
//  notificacao.swift
//  chat de turma
//
//  Created by user on 25/09/25.
//

import SwiftUI

enum TipoDeNotificacao:String {
    case forum, direto = "Mensagens"
    case canal = "Avisos"
}

struct Notificacao: View {
    let tipo:TipoDeNotificacao

    var icone:String {
        switch tipo {
        case .canal:
            return "rectangle.3.group.bubble.fill"
        case .direto:
            return "bubble.left.and.text.bubble.right.fill"
        case .forum:
            return "person.3.fill"
        }
    }
    
    var notificacao:String {
        switch tipo {
        case .canal:
            return "avisos"
        case .direto, .forum:
            return "mensagens"
        }
    }
    
    let horario:String = "10:20"
    
    var quantia:Int
    var quantiaString:String {
        if quantia >= 10 {
            return "9+"
        } else {
            return "\(quantia)"
        }
    }
    var quantiaTamanho:CGFloat {
        let returnLocal = CGFloat(12*quantiaString.count)
        
        if returnLocal <= 12 {
            return returnLocal + 12.0
        }
        else {
            return returnLocal
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(.black, lineWidth: 2)
                .frame(height: 100)
                .padding(.horizontal)
                .foregroundStyle(.white)
            
            HStack {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: icone)
                        .font(.system(size: 60))
                    
                    Text(quantiaString)
                        .frame(width: quantiaTamanho, height: quantiaTamanho)
                        .foregroundStyle(.white)
                        .background{
                            Circle()
                                .foregroundStyle(.red)
                        }
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    HStack {
                        //Spacer()
                        
                        Text("\(quantia) \(notificacao)")
                            .font(.system(size: 20, weight: .medium))
                        
                        //Spacer()
                    }
                    
                    Text(horario)
                }
            }
            .padding(.horizontal, 40)
        }
    }
}

#Preview {
    Notificacao(tipo: .canal, quantia: 3)
}

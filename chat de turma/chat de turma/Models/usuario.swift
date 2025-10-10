import Foundation
import SwiftUI

enum tipoDeConta:UInt8 {
    case aluno = 0
    case professor = 1
}

struct Usuario {
    let nome:String
    let hashSenha:String

    let id:UUID
    let idTurma:UUID

    let tipo:tipoDeConta
    
    private var fotoDePerfil:URL?
    
    func getPhoto() -> Image {
        if fotoDePerfil == nil || true { // remover true quando tiver um sistema adequado pra fotos
            return Image(systemName: "person.fill")
        }
        
        return Image(systemName: "person.fill")
    }
}

import Foundation

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
}

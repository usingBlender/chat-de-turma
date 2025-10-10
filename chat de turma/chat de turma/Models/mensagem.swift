import Foundation

struct Mensagem: Identifiable {
    var id:UUID = .init()
    
    var mensagemID:UUID
    var usuarioID:UUID

    var conteudo:MensagemConteudo
}

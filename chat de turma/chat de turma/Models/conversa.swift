import Foundation

enum tipoDeConversa {
    case chat
    case direto
    case canal
}

struct Conversa {
    let tipo:tipoDeConversa

    let participantes:[Usuario]
    let conversaID:UUID

    var mensagens:[Mensagem]
}

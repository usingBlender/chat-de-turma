import Foundation

enum TipoDeConteudo {
    case arquivo
    case imagem
    case mensagem
}

struct MensagemConteudo {
    let conteudo:Any // to-do: verificar se isso é necessário ao fazer o resto
    let tipo:TipoDeConteudo
}

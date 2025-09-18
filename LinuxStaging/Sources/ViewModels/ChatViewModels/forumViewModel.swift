import Foundation

class ForumViewModel {
    // PROPRIEDADES
    var usuario:Usuario
    var forum:Conversa?

    // FUNÇÕES

    func enviarMensagem(mensagem:MensagemConteudo) {
        let mensagemLocal:Mensagem = Mensagem(mensagemID: UUID(), usuarioID: usuario.id, conteudo: mensagem)

        forum?.mensagens.append(mensagemLocal)

        // enviar ao basket o forum novo
    }

    // obs: verificar na view se vai mostrar ou não o botão de editar (editavel somente mensagens, o resto só deletando)
    func editarMensagem(mensagem:Mensagem, mensagemNovo:String) {
        let indice = forum?.mensagens.firstIndex(where: { $0.mensagemID == mensagem.mensagemID }) // pega o indice nas mensagens

        var mensagemLocal = mensagem
        mensagemLocal.conteudo = MensagemConteudo(conteudo: mensagemNovo, tipo: .mensagem)

        forum?.mensagens.insert(mensagemLocal, at: indice!) // o certo era não fazer isso, ver depois um jeito melhor

        // enviar ao basket o forum novo
    }

    func deletarMensagem(mensagem:Mensagem) {
        let indice = forum?.mensagens.firstIndex(where: { $0.mensagemID == mensagem.mensagemID })

        forum?.mensagens.remove(at: indice!)

        // enviar ao basket o forum novo
    }

    // INICIALIZADOR
    init(usuario:Usuario) {
        self.usuario = usuario

        // pegar o canal com base no usuario
    }
}

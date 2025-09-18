import Foundation

class CanalViewModel {
    // PROPRIEDADES
    var usuario:Usuario
    var canal:Conversa?

    // FUNÇÕES

    func enviarMensagem(mensagem:MensagemConteudo) {
        let mensagemLocal:Mensagem = Mensagem(mensagemID: UUID(), usuarioID: usuario.id, conteudo: mensagem)

        canal?.mensagens.append(mensagemLocal)

        // enviar ao basket o canal novo
    }

    // obs: verificar na view se vai mostrar ou não o botão de editar (editavel somente mensagens, o resto só deletando)
    func editarMensagem(mensagem:Mensagem, mensagemNovo:String) {
        let indice = canal?.mensagens.firstIndex(where: { $0.mensagemID == mensagem.mensagemID }) // pega o indice nas mensagens

        var mensagemLocal = mensagem
        mensagemLocal.conteudo = MensagemConteudo(conteudo: mensagemNovo, tipo: .mensagem)

        canal?.mensagens.insert(mensagemLocal, at: indice!) // o certo era não fazer isso, ver depois um jeito melhor

        // enviar ao basket o canal novo
    }

    func deletarMensagem(mensagem:Mensagem) {
        let indice = canal?.mensagens.firstIndex(where: { $0.mensagemID == mensagem.mensagemID })

        canal?.mensagens.remove(at: indice!)

        // enviar ao basket o canal novo
    }

    // INICIALIZADOR
    init(usuario:Usuario) {
        self.usuario = usuario

        // pegar o canal com base no usuario
    }
}

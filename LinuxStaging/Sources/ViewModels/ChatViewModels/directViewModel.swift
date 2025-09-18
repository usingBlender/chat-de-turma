import Foundation

// Esse viewmodel vai ser chamado individualmente por view, não através do viewmodel da turma, mas usando o mesmo para providenciar o usuário
class ChatDiretoViewModel {
    // PROPRIEDADES
    var usuarioLocal:Usuario
    var usuarioAlvo:Usuario

    var chatDireto:Conversa?

    // FUNÇÕES

    func enviarMensagem(mensagem:MensagemConteudo) {
        let mensagemLocal:Mensagem = Mensagem(mensagemID: UUID(), usuarioID: usuarioLocal.id, conteudo: mensagem)

        chatDireto?.mensagens.append(mensagemLocal)

        // enviar ao basket o chatDireto novo
    }

    // obs: verificar na view se vai mostrar ou não o botão de editar (editavel somente mensagens, o resto só deletando)
    func editarMensagem(mensagem:Mensagem, mensagemNovo:String) {
        let indice = chatDireto?.mensagens.firstIndex(where: { $0.mensagemID == mensagem.mensagemID }) // pega o indice nas mensagens

        var mensagemLocal = mensagem
        mensagemLocal.conteudo = MensagemConteudo(conteudo: mensagemNovo, tipo: .mensagem)

        chatDireto?.mensagens.insert(mensagemLocal, at: indice!) // o certo era não fazer isso, ver depois um jeito melhor

        // enviar ao basket o chatDireto novo
    }

    func deletarMensagem(mensagem:Mensagem) {
        let indice = chatDireto?.mensagens.firstIndex(where: { $0.mensagemID == mensagem.mensagemID })

        chatDireto?.mensagens.remove(at: indice!)

        // enviar ao basket o chatDireto novo
    }

    // INICIALIZADOR
    init(usuario:Usuario, alvo:Usuario) {
        self.usuarioLocal = usuario
        self.usuarioAlvo = alvo

        // pegar o chat com base no usuario e alvo
    }
}

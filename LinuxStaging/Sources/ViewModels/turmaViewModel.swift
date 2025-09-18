import Foundation

class TurmaViewModel {
    // PROPRIEDADES
    let usuario:Usuario
    var turma:Turma? // anulavel temporariamente, TO-DO: remover antes de completar esse viewmodel

    public private(set) var canalViewModel:CanalViewModel
    public private(set) var forumViewModel:ForumViewModel

    // FUNÇÕES

    // INICIALIZADOR
    init(usuario: Usuario) {
        self.usuario = usuario

        self.canalViewModel = CanalViewModel(usuario: usuario)
        self.forumViewModel = ForumViewModel(usuario: usuario)

        // turma = pegar da base de dados com base no usuário
    }
}

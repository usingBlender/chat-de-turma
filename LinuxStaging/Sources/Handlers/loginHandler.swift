import Foundation
// import CryptoKit

class LoginHandler {
    var usuario:Usuario? = nil
    
    func autenticarLogin(nome:String, senha:String) -> Bool {
        // implementar CryptoKit (sha256)
        // verificar na base de dados, responder com base do erro

        UserDefaults.standard.set(nome, forKey: "nome") // salva o nome no aplicativo toda vez q der login

        return true // caso tudo der certo
    }

    func registrarConta(nome:String, senha:String, tipoDeConta:tipoDeConta, idDeTurma:UUID? = nil) {
        // função de registrar
    }
}

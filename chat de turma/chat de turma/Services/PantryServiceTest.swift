//
//  File.swift
//  chat de turma
//
//  Created by user on 28/09/25.
//

import Foundation

struct PantryTeste:Codable {
    var teste1:String
}

class PantryServiceTest {
    static func Test1() {
        Task {
            let service = PantryService()
            
            let item:Result<PantryTeste, Error> = await service.get(pantryType: .credentials)
            
            switch item {
            case .success(let output):
                print("SUCESSO NO TESTE:")
                print(output)
            case .failure(let output):
                print("FALHA NO TESTE:")
                print(output)
            }
        }
    }
}

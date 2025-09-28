import Foundation

class PantryService {
    // enum
    enum PantryURL:String {
        case credentials = "/basket/credentials"
        
        func getPantryURL() -> String? {
            let start = "https://getpantry.cloud/apiv1/pantry/"
            let pantryID = UserDefaults.standard.string(forKey: "PantryID")
            
            guard let pantryID = pantryID else {
                return nil
            }
            
            return start + pantryID + self.rawValue
        }
    }
    
    // var
    
    // func
    
    func get<T: Codable>(pantryType:PantryURL) async -> Result<T, Error> { // generics my beloved
        guard let urlString = pantryType.getPantryURL(), let url = URL(string: urlString) else {
            return Result.failure(ErrosPantry.URLInvalido)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode < 300 && httpResponse.statusCode >= 200 else {
                return Result.failure(ErrosPantry.APIErro)
            }
            
            if let decodedData = try? JSONDecoder().decode(T.self, from: data) {
                return Result.success(decodedData)
            } else {
                return Result.failure(ErrosPantry.JSONErro)
            }
            
        } catch {
            print("ERRO EM FUNÇÃO GET DO PANTRYSERVICE: \(error)")
            
            return Result.failure(error)
        }
    }
    
    func post<T: Codable>(pantryType:PantryURL, input:T) async -> Result<String, Error> {
        guard let urlString = pantryType.getPantryURL(), let url = URL(string: urlString) else {
            return Result.failure(ErrosPantry.URLInvalido)
        }
        
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            guard let encodedData = try? JSONEncoder().encode(input) else {
                return Result.failure(ErrosPantry.JSONErro)
            }
            
            urlRequest.httpBody = encodedData
            
            var (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode < 300 && httpResponse.statusCode >= 200 else {
                return Result.failure(ErrosPantry.APIErro)
            }
            
            guard let retorno = String(data: data, encoding: .utf8) else {
                return Result.failure(ErrosPantry.ErroDesconhecido)
            }
            
            return Result.success(retorno)
        } catch {
            print("ERRO EM FUNÇÃO POST DO PANTRYSERVICE: \(error)")
            
            return Result.failure(error)
        }
    }
}

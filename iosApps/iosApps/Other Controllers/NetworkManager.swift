//
//  NetworkManager.swift
//  iosApps
//
//  Created by Thibo Hoffman on 15/11/2020.
//

import Foundation
import SwiftyJSON
import Alamofire

class NetworkManager {
    
    struct Connectivity {
      static let sharedInstance = NetworkReachabilityManager()!
      static var isConnectedToInternet:Bool {
          return self.sharedInstance.isReachable
        }
    }
    
    static func login(email: String, password: String, completion: @escaping (LoginModel) -> Void) {
        
        guard let url = URL(string: "https://ioscardgame.azurewebsites.net/api/Account/") else { return }
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        var loginmodel: LoginModel!
        
        session.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(LoginModel.self, from: data) {
                    DispatchQueue.main.async {
                        print(decodedResponse)
                        loginmodel = decodedResponse
                        let defaults = UserDefaults.standard
                        defaults.set(loginmodel.token, forKey: "token")
                        defaults.set(loginmodel.gebruikerID, forKey: "gebruikerID")
                        completion(loginmodel)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            return
        }.resume()
    }
    
    static func registreer(username: String, email: String, password: String, passwordConfirmation: String, completion: @escaping (LoginModel) -> Void) {
        
        guard let url = URL(string: "https://ioscardgame.azurewebsites.net/api/Account/Register") else { return }
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password,
            "passwordConfirmation": passwordConfirmation,
            "username": username
        ]
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        var loginmodel: LoginModel!
        
        session.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(LoginModel.self, from: data) {
                    DispatchQueue.main.async {
                        print(decodedResponse)
                        loginmodel = decodedResponse
                        let defaults = UserDefaults.standard
                        defaults.set(loginmodel.token, forKey: "token")
                        defaults.set(loginmodel.gebruikerID, forKey: "gebruikerID")
                        completion(loginmodel)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    static func getCards(min: Int, max: Int, completion: @escaping ([CardOnline]) -> Void) {
        let url = URL(string: "https://ioscardgame.azurewebsites.net/api/Card/Game/\(min)/\(max)")!
        let request = URLRequest(url: url)
        var cards: [CardOnline] = []
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(CardResponse.self, from: data) {
                    DispatchQueue.main.async {
                        cards = decodedResponse.cards
                        print(cards)
                        completion(cards)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    static func getMyCards(completion: @escaping ([CardOnline]) -> Void) {
        
        let defaults = UserDefaults.standard
        let id = defaults.integer(forKey: "gebruikerID")
        
        let url = URL(string: "https://ioscardgame.azurewebsites.net/api/Card/MyCards/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        var cards: [CardOnline] = []

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(CardResponse.self, from: data) {
                    DispatchQueue.main.async {
                        cards = decodedResponse.cards
                        print(cards)
                        completion(cards)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    static func likeCard(id: Int) {
        let url = URL(string: "https://ioscardgame.azurewebsites.net/api/Card/Like/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
        }.resume()
    }
    
    static func dislikeCard(id: Int) {
        let url = URL(string: "https://ioscardgame.azurewebsites.net/api/Card/Dislike/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
        }.resume()
    }
    
    static func reportCard(id: Int) {
        let url = URL(string: "https://ioscardgame.azurewebsites.net/api/Card/Report/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
        }.resume()
    }
    
    static func makeCard(text: String, completion:  @escaping (CardOnline) -> Void) {
        let url = URL(string: "https://ioscardgame.azurewebsites.net/api/Card/New")!
        
        let defaults = UserDefaults.standard

        let parameters: [String: Any] = [
            "text": text,
            "gebruikerID": defaults.integer(forKey: "gebruikerID")
        ]
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var card: CardOnline!
        
        session.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(CardOnline.self, from: data) {
                    DispatchQueue.main.async {
                        card = decodedResponse
                        completion(card)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct LoginModel: Codable {
    var token: String
    var gebruikerID: Int
}


struct CardOnline: Codable {
    var cardID: Int
    var gebruikerID: Int
    var text: String
    var likes: Int
    var dislikes: Int
    var reports : Int
    var likePercentage: Double
}

struct CardResponse: Codable {
    var cards: [CardOnline]
    
    init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            cards = try container.decodeArray(CardOnline.self)
    }
}


// SOURCE: https://stackoverflow.com/questions/46344963/swift-jsondecode-decoding-arrays-fails-if-single-element-decoding-fails

fileprivate struct DummyCodable: Codable {}

extension UnkeyedDecodingContainer {

    public mutating func decodeArray<T>(_ type: T.Type) throws -> [T] where T : Decodable {

        var array = [T]()
        while !self.isAtEnd {
            do {
                let item = try self.decode(T.self)
                array.append(item)
            } catch let error {
                print("error: \(error)")

                // hack to increment currentIndex
                _ = try self.decode(DummyCodable.self)
            }
        }
        return array
    }
}
extension KeyedDecodingContainerProtocol {
    public func decodeArray<T>(_ type: T.Type, forKey key: Self.Key) throws -> [T] where T : Decodable {
        var unkeyedContainer = try self.nestedUnkeyedContainer(forKey: key)
        return try unkeyedContainer.decodeArray(type)
    }
}

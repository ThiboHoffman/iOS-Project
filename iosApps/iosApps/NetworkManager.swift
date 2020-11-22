//
//  NetworkManager.swift
//  iosApps
//
//  Created by Thibo Hoffman on 15/11/2020.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    
    static let myCards = "https://iosapiproject.azurewebsites.net/api/Card/MyCards/"

    static func getCards(completion: @escaping ([CardOnline]) -> Void) {
        let url = URL(string: "https://iosapiproject.azurewebsites.net/api/Card")!
        let request = URLRequest(url: url)
        var cards: [CardOnline] = []
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(CardResponse.self, from: data) {
                    DispatchQueue.main.async {
                        cards = decodedResponse.cards
                        completion(cards)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    static func getMyCards(id: Int, completion: @escaping ([CardOnline]) -> Void) {

        let url = URL(string: "https://iosapiproject.azurewebsites.net/api/Card/MyCards/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        var cards: [CardOnline] = []

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(CardResponse.self, from: data) {
                    DispatchQueue.main.async {
                        cards = decodedResponse.cards
                        completion(cards)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    static func likeCard(id: Int) {
        let url = URL(string: "https://iosapiproject.azurewebsites.net/api/Card/Like/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
        }.resume()
    }
    
    static func dislikeCard(id: Int) {
        let url = URL(string: "https://iosapiproject.azurewebsites.net/api/Card/Dislike/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
        }.resume()
    }
    
    static func reportCard(id: Int) {
        let url = URL(string: "https://iosapiproject.azurewebsites.net/api/Card/Report/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
        }.resume()
    }
    
    static func makeCard(text: String, gebruikerID: Int, completion:  @escaping (CardOnline) -> Void) {
        let url = URL(string: "https://iosapiproject.azurewebsites.net/api/Card/New")!
        
        let parameters: [String: Any] = [
            "text": text,
            "gebruikerID": gebruikerID
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
                        print(card)
                        completion(card)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}


struct CardOnline: Codable {
    var cardID: Int
    var gebruikerID: Int
    var text: String
    var likes: Int
    var dislikes: Int
    var reports : Int
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

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
    
    static let endpoint = "https://iosapiproject.azurewebsites.net/api/Card"
    
    static func getCards(completion: @escaping ([CardOnline]) -> Void) {
        
        AF.request(endpoint, method: HTTPMethod.get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecorder = JSONDecoder()
                jsonDecorder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let cardData = try? jsonDecorder.decode(CardResponse.self, from: data) {
                    let cards = cardData.cards
                    print(cards)
                    completion(cards)
                }
                print("nee")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


struct CardOnline: Codable {
    var id: Int
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

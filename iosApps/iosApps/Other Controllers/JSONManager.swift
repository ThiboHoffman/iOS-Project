//
//  JSONManager.swift
//  iosApps
//
//  Created by Thibo Hoffman on 15/12/2020.
//

import Foundation
import SwiftyJSON


var cards: [String] = []
var indices: [Int] = []
var cardsPresent: Int = 0
var cardsWanted: Int = 5

class JSONManager {
    static func getCardsFromJSON(game: GameModel) -> [String] {
        
        let path = Bundle.main.path(forResource: "cards", ofType: "json")!

        let url = URL(fileURLWithPath: path)

        do {

            indices = []
            cards = []
            
            let data = try Data(contentsOf: url)

            let json = try JSON(data: data)
            cardsPresent = json[game.type.lowercased()]["cards"].count
            print(cardsPresent)
            
            for _ in 0...cardsWanted {
                var rand = Int.random(in: 1...cardsPresent)
                while (indices.contains(rand)) {
                    rand = Int.random(in: 1...cardsPresent)
                }
                indices.append(rand)
            }
            
            print(indices)
            for index in indices {
                if let textString = json[game.type.lowercased()]["cards"].array?[index-1]["text"].string {
                    cards.append(textString.replacingOccurrences(of: "${name}", with: String(game.players[Int.random(in: 0...(game.players.count-1))])))
                }
            }
            print(cards)
            
        } catch {

            print(error)
        }
        
        return cards
    }
}

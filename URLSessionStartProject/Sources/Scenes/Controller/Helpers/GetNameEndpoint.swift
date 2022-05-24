//
//  GetNameEndpoint.swift
//  URLSessionStartProject
//
//  Created by Михаил Багмет on 24.05.2022.
//

import Foundation

// MARK: - Запросы к API
final class GetNameEndpoint: ObjectResponseEndpoint<String> {
    private var characterID = "1010743"
    
    override var method: RESTClient.RequestType { return .get }
    override var path: String { "/v1/public/\(marvelSections.characters)/\(characterID)/\(marvelSections.series)" }
    
    override init() {
        super.init()

        queryItems = [URLQueryItem(name: "ts", value: marvelAPI.ts),
                      URLQueryItem(name: "apikey", value: marvelAPI.publicKey),
                      URLQueryItem(name: "hash", value: marvelAPI.hash)]
    }
}

extension GetNameEndpoint {
    enum marvelAPI {
        static let privateKey = "a55596761256d8716a4f7a235dfa46ac4c36f6b2"
        static let publicKey = "798ae286d11198894a08eb4b1dc8f8e1"
        
        static var ts: String {
            return String(Date().getCurrentTimestamp())
        }
        
        static var hash: String {
            return String(String(ts) + privateKey + publicKey).md5
        }
    }
    
    enum marvelSections {
        case characters
        case comics
        case creators
        case events
        case series
        case stories
    }
}

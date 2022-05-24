//
//  GetNameEndpoint.swift
//  URLSessionStartProject
//
//  Created by Михаил Багмет on 24.05.2022.
//

import Foundation

// MARK: - Запросы к API
final class GetNameEndpoint: ObjectResponseEndpoint<Cards> {
    private var cardNames: [String]
    
    override var method: RESTClient.RequestType { return .get }
    override var path: String { "/v1/cards" }
    
    init(cardNames: [String]) {
        self.cardNames = cardNames
        
        super.init()

        if cardNames.count > 0 {
            queryItems = [URLQueryItem(name: "name", value: "\(self.makeCardNamesParameter())")]
        }
    }
    
    private func makeCardNamesParameter() -> String {
        var parameterName = ""
        
        for card in cardNames {
            parameterName += "\(card)|"
        }
        
        parameterName.removeLast()
        return parameterName
    }
}

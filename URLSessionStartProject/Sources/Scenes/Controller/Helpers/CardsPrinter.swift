//
//  CardsPrinter.swift
//  URLSessionStartProject
//
//  Created by Михаил Багмет on 24.05.2022.
//

import Foundation

class CardsPrinter {
    func printCard(cards: [Card]) {
        for card in cards {
            self.printOptional(title: "Название", item: card.name)
            self.printOptional(title: "Тип", item: card.type)
            self.printOptional(title: "Стоимость маны", item: card.manaCost)
            self.printOptional(title: "Название сета", item: card.setName)
            self.printOptional(title: "Сила", item: card.power)
            self.printOptional(title: "Цвета", item: card.colors)
            print("\n")
        }
    }
    
    private func printOptional<T>(title: String, item: T?) {
        if let item = item {
            switch item {
            case is Array<Any>:
                if let array = item as? [Any] {
                    print("\(title): \(array.map { $0 as! String }.joined(separator: ", "))")
                }
            default:
                print("\(title): \(item)")
            }
        }
    }
}

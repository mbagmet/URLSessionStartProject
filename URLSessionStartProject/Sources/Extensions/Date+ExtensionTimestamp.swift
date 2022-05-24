//
//  Date+ExtensionTimestamp.swift
//  URLSessionStartProject
//
//  Created by Михаил Багмет on 23.05.2022.
//

import Foundation

extension Date {
    func getCurrentTimestamp() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}

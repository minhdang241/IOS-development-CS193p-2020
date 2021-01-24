//
//  Array+Identifiable.swift
//  CS193p (iOS)
//
//  Created by Minh Dang on 1/23/21.
//

import Foundation

extension Array where Element:Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

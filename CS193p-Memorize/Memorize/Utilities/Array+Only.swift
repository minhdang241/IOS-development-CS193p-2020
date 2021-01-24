//
//  Array+Only.swift
//  CS193p (iOS)
//
//  Created by Minh Dang on 1/24/21.
//

import Foundation

extension Array {
    var only: Element? {
        return self.count == 1 ? self.first : nil
    }
}

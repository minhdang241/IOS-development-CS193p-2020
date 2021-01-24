//
//  Grid.swift
//  CS193p (iOS)
//
//  Created by Minh Dang on 1/23/21.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        GeometryReader(content: { geometry in
            let layout = GridLayout(itemCount: items.count, in: geometry.size)
            ForEach(items) {item in
                body(for: item, in: layout)
            }
        })
    }
    
    private func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}



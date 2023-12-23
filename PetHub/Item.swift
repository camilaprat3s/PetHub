//
//  Item.swift
//  PetHub
//
//  Created by Camila Prates on 2023-12-22.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

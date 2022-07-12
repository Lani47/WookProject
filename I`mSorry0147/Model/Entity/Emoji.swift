//
//  Emoji.swift
//  CombineSample
//
//  Created by npc on 2022/05/19.
//

import SwiftUI

// Viewで使うエンティティ
struct Emoji: Identifiable {
    
    let id: UUID = UUID()
    // JSONから得られるkey
    let name: String
    // urlから得られる画像
    var image: Image?
    // JSONから得られるvalue
    let url: URL?
    
}

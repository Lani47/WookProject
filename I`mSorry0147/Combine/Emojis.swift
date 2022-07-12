//
//  Emojis.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/04.
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

//
//  EmojiResponse.swift
//  CombineSample
//
//  Created by npc on 2022/05/19.
//

import Foundation

// keyが定まらないJSONに対し、Decodeするための構造体
struct EmojiResponse {
    // 絵文字は複数あるので配列化する
    var emojiElements: [EmojiElement]
    
    // JSONからnameとemojiURLの2つを取得する
    struct EmojiElement {
        let name: String
        let emojiURL: URL?
    }
}

// 比較可能にする（ソートしたい）
extension EmojiResponse.EmojiElement: Comparable {
    static func < (lhs: EmojiResponse.EmojiElement, rhs: EmojiResponse.EmojiElement) -> Bool {
        lhs.name < rhs.name
    }
}

// Decodableに準拠する。ただし、今回は分解の定義を自作する
extension EmojiResponse: Decodable {

    // nameとemojiURLという名前のkeyにする
    struct EmojiCodingKey: CodingKey {
        var stringValue: String
        
        // 今回はStringValueだけ
        init? (stringValue: String) {
            self.stringValue = stringValue
        }
        
        // intValueを返す予定はないので処理を潰しておく
        var intValue: Int?
        init? (intValue: Int) { nil }
        
        // keyの名前の定義をしておく
        static let name = EmojiCodingKey(stringValue: "name")!
        static let emojiURL = EmojiCodingKey(stringValue: "emojiURL")!
        
    }
    
    // ここはEmojiResultの初期化処理
    init(from decoder: Decoder) throws {
        // emojiElementsは空の配列で初期化しておく
        emojiElements = []
        // containerは入れ物。EmojiCodingKeyで分解されたものが入る入れ物
        // 元のJSONはkeyがバラバラのものが複数ある▶複数のkeyがある状態
        // 例えば"accept": "https://github.githubassets.com/images/icons/emoji/unicode/1f251.png?v8"の場合
        // keyはEmojiCodingKey(stringValue: "accept", intValue: nil)として入っている
        let container = try decoder.container(keyedBy: EmojiCodingKey.self)
        // containerの中にあるたくさんのkeyの情報を一つずつ取り出す
        for key in container.allKeys {
            // keyとvalueをそれぞれEmojiElementのnameとemojiURLに入れ直す
            // keyはEmojiCodingKey(stringValue: "accept", intValue: nil)であるため、stringValueをnameに使う
            // emojiURLは、keyからValueを取ってくる。入れ物の中からkeyをもとにして分解する（container.decode)が行われている
            let emojiElement = EmojiElement(name: key.stringValue,
                                            emojiURL: try container.decode(URL.self,
                                                                           forKey: EmojiCodingKey(stringValue: key.stringValue)!)
                                          )
            // 順序関係なくとりあえず詰め込んでいく
            emojiElements.append(emojiElement)
        }
        
    }
}

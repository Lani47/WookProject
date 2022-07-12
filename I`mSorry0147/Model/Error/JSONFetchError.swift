//
//  JSONFetchError.swift
//  CombineSample
//
//  Created by npc on 2022/05/19.
//

import Foundation

// JSON取得（通信時）エラー
enum JSONFetchError: Error {
    
    // ネットワークエラー
    case networkError
    // ステータスエラー
    case statusError(Int)
    // その他のエラー
    case otherError(Error)
    // データエラー
    case dataError
    // パースエラー
    case parseError(Error)
}

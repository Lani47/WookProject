//
//  EmojiViewModelError.swift
//  CombineSample
//
//  Created by npc on 2022/05/19.
//

import Foundation

enum EmojiViewModelError: Error {
    case urlError
    case fetchError
    case parseError
    
    var message: String {
        switch self {
        case .urlError:
            return "URLが正しくありません。\nhoge@jec.ac.jpにお問い合わせください"
        case .fetchError:
            return "絵文字の取得に失敗しました。\n時間を置いて試してください"
        case .parseError:
            return "製作者:hoge@jec.ac.jpにお問い合わせください"
        }
    }
}

//
//  RequestStatus.swift
//  CombineSample
//
//  Created by npc on 2022/05/19.
//

import Foundation

/// ステータス管理用のenum
enum RequestStatus {
    case unexecuted         // 未実行
    case success            // 成功
    case midway             // 途中
    case failed(Error)      // 失敗
}

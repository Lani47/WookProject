//
//  Fecher.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/04.
//

//import Foundation
//
//// Resultを使ったやりかた。
//// 教えたやり方
//struct Fetcher {
//    /// インスタンスはつくらせない
//    private init() {}
//
//    /// URLRequestの指定がある場合（POST送信など）はこちらを呼ぶ
//    /// 処理の結果、失敗かどうかはResultで判定する
//    ///
//    /// - Parameters:
//    ///   - request: 設定済みのrequest
//    ///   - session: 指定がない場合はnil。
//    ///   - handler: データ取得後の処理
//    /// - Returns: データとエラーステータス
//    static func fetch(from request: URLRequest, session: URLSession? = nil) async -> Result<Data, Error> {
//        let session = (session == nil) ? URLSession(configuration: .default) : session!
//
//        do {
//            // awaitを使う 非同期（別スレッド）で実行中
//            let (data, response) = try await session.data(for: request)
//
//            guard let response = response as? HTTPURLResponse else {
//                return .failure(JSONFetchError.networkError)
//            }
//
//            if !(200...299).contains(response.statusCode) ,
//                !(300...399).contains(response.statusCode) {
//                print("ステータスコードが正常ではありません： \(response.statusCode)")
//                return .failure(JSONFetchError.statusError(response.statusCode))
//            }
//            return .success(data)
//        } catch(let error) {
//            return .failure(error)
//        }
//    }
//}

//
//  Delegate.swift
//  CombineSample
//
//  Created by npc on 2022/05/19.
//

import Foundation

// プロトコルを作る
// このプロトコルに準拠している場合、FetcherDelegate型のプロパティに設定する事ができる※１
protocol FetcherDelegate {
    // 成功時の処理
    func completionHandler(data: Data)
    
    // 失敗時の処理
    func completionHandler(error: Error)
}
//urlsesionの処理をViewModelからここに投げてる?
class FetcherDelegateSample {
    
    // ※１で書いた通り、準拠している型であればdelegateプロパティの中に入れることができる
    var delegate: FetcherDelegate? = nil
    //処理を依頼されたら発動
    func fetch(from request: URLRequest, session: URLSession? = nil) throws {
        let session = (session == nil) ? URLSession(configuration: .default) : session!
        
        
        session.dataTask(with: request) { data, response, error in
            
            // errorに値があったら処理終了
            if let error = error {
                // delegateの関数を実行する
                self.delegate?.completionHandler(error: JSONFetchError.otherError(error))
                return
            }
            
            // responseがなくても処理終了
            guard let response = response as? HTTPURLResponse else {
                // delegateの関数を実行する
                self.delegate?.completionHandler(error: JSONFetchError.networkError)
                return
            }
            
            // ステータスコード異常でも処理終了
            if !(200...299).contains(response.statusCode) ,
               !(300...399).contains(response.statusCode) {
                print("ステータスコードが正常ではありません： \(response.statusCode)")
                // delegateの関数を実行する
                self.delegate?.completionHandler(error: JSONFetchError.statusError(response.statusCode))
                return
            }
            
            // データがなくても処理終了
            guard let data = data else {
                // delegateの関数を実行する
                self.delegate?.completionHandler(error: JSONFetchError.dataError)
                return
            }
            
            // 問題がない時の処理
            self.delegate?.completionHandler(data: data)
            
            
        }.resume()
        
    }
    
}

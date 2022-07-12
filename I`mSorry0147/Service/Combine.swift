//
//  Combine.swift
//  CombineSample
//
//  Created by npc on 2022/05/19.
//

import Foundation
import Combine

// 共通化処理にする
// ここでできるのはDecodableのエンティティをJSONDecoderでデコードするだけ
final class CombineSample<DecodeItem: Decodable> {
    
    // AnyPublisher<Output, Failure> where Failure : Error
    // 今回はOutputにDecodableのインスタンス、FailureにはJSONFetchErrorを使う
    func fetch(from request: URLRequest, session: URLSession? = nil) -> AnyPublisher<DecodeItem, JSONFetchError> {
        let session = (session == nil) ? URLSession(configuration: .default) : session!
        
        // 使うのはdataTaskPublisher。
        // eraseToAnyPublisherでAnyPublisherに変わる
        return session.dataTaskPublisher(for: request)
            // 内部でエラーが起きるようになっているのでtryMap
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse else {
                    throw JSONFetchError.networkError
                }
                
                if !(200...299).contains(response.statusCode) ,
                   !(300...399).contains(response.statusCode) {
                    print("ステータスコードが正常ではありません： \(response.statusCode)")
                    throw JSONFetchError.statusError(response.statusCode)
                }
                
                return data
            }
            // Errorが渡ったら、failure処理になる
            .mapError { failure in failure }
            // JSONをパースする
            .decode(type: DecodeItem.self, decoder: JSONDecoder())
            // parseに失敗してもfailure処理になる
            .mapError { error in JSONFetchError.parseError(error) }
            // mainスレッドで実施
            .receive(on: RunLoop.main)
            // こちらでもよい(違いはあるが今は考慮しなくてOK）
            //.receive(on: DispatchQueue.main)
            // Publisherの共通化
            .eraseToAnyPublisher()
    }
    
    
}

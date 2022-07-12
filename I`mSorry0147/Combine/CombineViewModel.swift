//
//  CombineViewModel.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/04.
//
//
//import SwiftUI
//import Combine
//
//final class CombineViewModel: ObservableObject {
//    private(set) var emojis: [Emoji] = []
//    
//    // この値に変更があったら更新する
//    // 実行ステータス
//    @Published var status: RequestStatus
//    
//    // JSONを手に入れるだけ
//    let firstSubject: PassthroughSubject<Void, Never>
//    // 画像を手に入れる
//    let secondSubject: PassthroughSubject<Void, Never>
//    // Model
//    let combine: CombineSample<EmojiResponse>
//    // おまじないだと思えばOK
//    var cancellable: Set<AnyCancellable>
//    
//    
//    init() {
//        status = .unexecuted
//        // インスタンス作成
//        firstSubject = PassthroughSubject()
//        secondSubject = PassthroughSubject()
//        combine = CombineSample()
//        cancellable = []
//        
//        // エラーの握りつぶしは駄目
//        try? settings()
//    }
//    
//    func settings() throws {
//        
//        guard let emojiEndpoint = infoForKey("GitEmojiEndpoint"),
//              let url = URL(string: "https://" + emojiEndpoint) else {
//            throw EmojiViewModelError.urlError
//        }
//        
//        // Justを使った書き方もある
//        // PassthroughSubjectが<Void, Never>ならこれでもOK
//        Just(combine.fetch(from: URLRequest(url: url)))
//            // AnyPublisherからOutputを取り出す
//            .output
//            .map { $0.emojiElements.sorted() }
//            // スレッドを変える 非同期?
//            .receive(on: DispatchQueue.global())
//            // Subscriber
//            .sink { result in
//                switch result {
//                    //終わったら？
//                case .finished:
//                    print("====2====")
//                    print(Thread.isMainThread)
//                    //viewをメインスレッドで更新させる
//                    DispatchQueue.main.async {
//                        print("====3====")
//                        print(Thread.isMainThread)
//                        self.status = .midway
//                        print(self.status)
//                    }
//                    
//                    
//                    print("====4====")
//                    print(Thread.isMainThread)
//                    self.secondSubject.send(())
//                    self.secondSubject.send(completion: .finished)
//                    
//                case .failure(let error):
//                    print(error)
//                    DispatchQueue.main.async {
//                        self.status = .failed(error)
//                    }
//                }
//                //情報を受け取り次第?
//            } receiveValue: { [self] element in
//                print("====1====")
//                print(Thread.isMainThread)
//                element.forEach { element in
//                    //emojisというデータをまとめるファイルに入れる？　見つけ次第
//                    self.emojis.append(Emoji(name: element.name, url: element.emojiURL))
//                }
//                
//            }
//            .store(in: &cancellable)
//
//        
//        // Justを使わない書き方。どちらでも良い
////        firstSubject
////            // fetchした結果を取り出す
////            .flatMap { [self] in
////                combine.fetch(from: URLRequest(url: url))
////            }
////            .map { $0.emojiElements.sorted() }
////            .receive(on: DispatchQueue.global())
////            .sink { result in
////                switch result {
////
////                case .finished:
////                    print("====2====")
////                    print(Thread.isMainThread)
////                    DispatchQueue.main.async {
////                        print("====3====")
////                        print(Thread.isMainThread)
////                        self.status = .midway
////                        print(self.status)
////                    }
////
////
////                    print("====4====")
////                    print(Thread.isMainThread)
////                    self.secondSubject.send(())
////                    self.secondSubject.send(completion: .finished)
////
////                case .failure(let error):
////                    print(error)
////                    DispatchQueue.main.async {
////                        self.status = .failed(error)
////                    }
////                }
////            } receiveValue: { [self] element in
////                print("====1====")
////                print(Thread.isMainThread)
////                element.forEach { element in
////                    self.emojis.append(Emoji(name: element.name, url: element.emojiURL))
////                }
////
////            }
////            .store(in: &cancellable)
//        
//        
//        
//        secondSubject.sink { result in
//            switch result {
//                
//            case .finished:
//                print("====6====")
//                print(Thread.isMainThread)
//                DispatchQueue.main.async {
//                    self.status = .success
//                }
//                
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self.status = .failed(error)
//                }
//                
//            }
//        } receiveValue: { [self] in
//            print("====5====")
//            print(Thread.isMainThread)
//            for index in emojis.indices {
//                let emoji = emojis[index]
//                let imageResult = makeEmoji(from: emoji.url)
//                
//                switch imageResult {
//                    //とってきた画像を配列に入れる？
//                case .success(let image): emojis[index].image = image
//                case .failure(let error): print(error)
//                }
//                //重くしない？
//                if index % 20 == 0 {
//                    DispatchQueue.main.async {
//                        self.status = .midway
//                    }
//                    
//                }
//            }
//        }
//        //必須のおまじない
//        .store(in: &cancellable)
//        
//        firstSubject.send(())
//        firstSubject.send(completion: .finished)
//        
//        print("非同期なので終わる前にこのメッセージは表示される")
//    }
//    //urlを渡したらimageが帰ってくる
//    private func makeEmoji(from url: URL?) -> Result<Image, EmojiViewModelError>{
//        
//        guard let url = url,
//              let data = try? Data(contentsOf: url),
//              let image = UIImage(data: data) else {
//            return .failure(EmojiViewModelError.fetchError)
//        }
//        return .success(Image(uiImage: image))
//    }
//}

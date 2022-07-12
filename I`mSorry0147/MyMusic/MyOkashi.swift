//
//  MyOkashi.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/12.
//

import Foundation
import UIKit
import Combine
//お菓子の情報をIdentifiableでまとめる構造体の一種
struct OkashiItem: Identifiable {
    //idを生成 お菓子を区別するため？に番号を
    let id = UUID()
    let name: String
    let link: URL
    let image: UIImage
}
//テキストのいいところ？　怪文書
/*
 ドッグコメントがある
 警告がない
 画像リソースをxcassetsで管理してる
 URLの組み立てにURLQueryitemを使っている
 コードをグルーピングして管理している
 Decodableを使っている
 */

class OkashiData: ObservableObject{
    ///お菓子のデータ構造　データを受け取る時に使う
    struct ResultJson: Codable {
        struct Item: Codable {
            //お菓子の名前
            let name: String?
            //お菓子のurl
            let url: URL?
            //画像url
            let image: URL?
        }
        //上の3つを配列にまとめる
        let item: [Item]?
    }
    //お菓子のリスト Identifiableプロトコル プロパティを監視して自動通知
    @Published var okashiList: [OkashiItem] = []
    
    /// キーワードを入れて検索する
    func searchOkashi(keyword: String){
        //確認のために出力
        print(keyword)
        //検索ワードをURLエンコードしてURLとして使えるように
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        //URLを組み立てる URLというオブジェクトにして初めてURLになれる 失敗したらreturnするそしてnilを返す？
        guard let req_url = URL(string: "https://www.sysbird.jp/webapi/?apikey=guest&keyword=\(keyword_encode)&format=json") else { return
            
        }
        print(req_url)
   //リクエストに必要なurlを作る
    let req = URLRequest(url: req_url)
        
        
        

        
        
    //データ転送を管理するためのセッションを生成？
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    ///リクエストをtaskで呼べるようにする？　サーバーにリクエストするテンプレ？
    let task = session.dataTask(with: req, completionHandler: {
        (data, response , error) in
        //セッション終わり
        session.finishTasksAndInvalidate()
        do {
             //JSONDecoder()のインスタンス
            let decoder = JSONDecoder()
            //受け取っjsonデータを解析してjsonに格納　上のデータ構造が必要なのはこれが理由
            let json = try decoder.decode(ResultJson.self, from: data!)

              
            //ここで受け取ったデータをprint
//
            if let items = json.item {
                //新規に行うため一旦リセット
                self.okashiList.removeAll()
                //お菓子の数だけ処理
                for item in items {
                    //お菓子の情報をアンラップ
                   if let name = item.name ,
                    let link = item.url ,
                    //ここで画像のurlをUIImageに通せるようにする？
                    let imageUrl = item.image ,
                    let imageData = try? Data(contentsOf: imageUrl) ,
                    let image = UIImage(data: imageData)?.withRenderingMode(.alwaysOriginal){
                    //OkashiItemを一個にまとめて作り直して
                    let okashi = OkashiItem(name: name, link: link, image: image)
                    //配列に追加
                    self.okashiList.append(okashi)
                   }
                }
                print(self.okashiList)
            }
        } catch {
            print("エラー")
        }
        
    })
        //ここでtaskを実行
    task.resume()
    }//searchOkashiここまで
    
}

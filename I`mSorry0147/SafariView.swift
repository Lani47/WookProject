//
//  SafariView.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/12.
//

import SwiftUI
import SafariServices


struct SafariView: UIViewControllerRepresentable {//view関連の関数は自動生成してほしい...
    var url: URL
    
    //Viewが更新した時
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //あるだけでいいから。
    }
    //VIEWが起動した時
    func makeUIViewController(context: Context) -> SFSafariViewController {
        //URLをしまってサファリを起動
        return SFSafariViewController(url: url)
    }
    
   
}

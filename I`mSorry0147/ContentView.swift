//
//  ContentView.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/04.
//

import SwiftUI

struct ContentView: View {
    @State var showSafari = false
    var body: some View {
        
            
            TabView {
    //            Text(infoForKey("Hoge") ?? "")
                VStack{
                    Text(("今まで作った作品をMVVM要素とCombine要素でリメイクしました。"))
                    Button(action: {

                        self.showSafari.toggle()
                    }) {
                        Text("使用音声素材:効果音ラボ")
                    }
                    .sheet(isPresented: self.$showSafari, content: {
                    
                        //ここで作ったviewを表示する
                        SafariView(url: URL(string: "https://soundeffect-lab.info/")!)
                        //下をいっぱいにして指定
                            .edgesIgnoringSafeArea(.bottom)
                    })
                }
               
                
                
                    .tabItem {
                        Image(systemName: "1.circle.fill")
                        Text("このアプリの説明")
                    }
                
                JankenView()
                    .tabItem {
                        Image(systemName: "2.circle.fill")
                        Text("ジャンケン")
                    }
                
                TimerView()
                    .tabItem {
                        Image(systemName: "3.circle.fill")
                        Text("タイマー")
                    }
                
               
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

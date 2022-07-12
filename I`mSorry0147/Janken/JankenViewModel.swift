//
//  JankenViewModel.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/04.
//

import SwiftUI
import Combine

final class JankenViewModel: ObservableObject {
    
    //SoundPlayer内のfuncをこのクラスで使えるようにするためのインスタンス生成
    let soundPlayer = SoundPlayer()
    @Published var imageShow = true
    @Published var ansorNumber = 0
    @Published var bakusin = 0
    @Published var rojita = 0
    @Published var bottonBool = true
    @Published var textbox = "これからジャンケンをします。"
    //    @Binding var Halo : Bool
    
    var flag = false
    //これもまたcombine
    var combineumadole: AnyCancellable?
    
    var timerHandler : Timer?
    //画像を変数にすることで画像を変えたりできる
    @Published var Imagezo = "gu"
    //秒を数える変数
    var count = 0
    
    //画像の種類識別
    var imagecount = 0
    
    var outputText: String = "初期テキスト"
    
    //永続化？秒数
    @AppStorage("timer_value") var timerValue = 10
    
    
    func gameStart(){
        repeat{
            ansorNumber = Int.random(in: 1..<4)   // 1から3の範囲で整数（Int型）乱数を生成
            
        }while ansorNumber == bakusin
        
        
        bakusin = ansorNumber
        
        //ジャンケン数字がゼロなら
        if ansorNumber == 0{
            
            
            textbox = "これからジャンケンをします"
            
            
            
        } else if ansorNumber == 1{
            
            Imagezo = "gu"
            textbox = "グー"
            
            //1ならグー
            
            
        } else if ansorNumber == 2{
            Imagezo = "choki"
            textbox = "チョキ"
            //2ならグー
            
        } else {
            
            Imagezo = "pa"
            textbox = "パー"
            //3ならグー
            
        }
    }
    func startTimer(){
        
        self.imageShow = false
        textbox = "ジャン!"
        self.count = 0
        

        
        
        combineumadole = combineModoki().sink() { _ in

            
            self.check()
            
        }
    }
    func combineModoki() -> Future<Void, Never> {
        return Future() { promise in
            DispatchQueue.main.asyncAfter(deadline:.now() + 1) {
                promise(Result.success(()))
            }
        }
    }
    
    func check(){
        textbox = "ケン!"
        
        
        
        self.count += 1
        
        self.count = 0
        combineumadole = combineModoki().sink() { _ in
            self.imageShow = true
            
            print("HOGE")
            self.gameStart()

            
        }
    }
    
}


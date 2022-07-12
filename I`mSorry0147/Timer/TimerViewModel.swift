//
//  TimerViewModel.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/08.
//

import AudioToolbox
import SwiftUI
import UserNotifications
import Combine

final class TimerViewModel: ObservableObject {
    
    //振動させる機能のインスタンス？
    let generator = UINotificationFeedbackGenerator()
    //振動させたか管理
    @Published var isVibrationOn = false
    
    //バーの停止の制御
    @Published var enable: Bool = true
    //大麻の変数 まだ未確定
    @Published var timerhandler : Timer?
    //経過時間のカウント
    @Published var count = 0
    //永続化する秒数設定 なんと勝手に保存してくれる
    @AppStorage("timer_value") var timerValue = 10.0
    //アラーム表示
    @Published var showAlert = false
    
    @Published var timerflag = true
    //秒数の避難先
    @Published var timerkeep = 1.0
    //音を使い分ける設定
    @AppStorage("musicValue") var musicValue = 0
    //音を鳴らすためのクラスをインスタンス
     let soundPalyer = SoundPlayer()
    
    @Published var image = "backgroundTimer"
    
    func alertTimer(){
        print("了解がタップされた")
        timerValue = 0
        count = 0
        enable = true
        //音楽を止める
        if(musicValue == 1){
            soundPalyer.keikokuPlayer.stop()
            print("警告ストップ")
        } else if (musicValue == 2){
            soundPalyer.sentakuPlayer.stop()
            print("洗濯ストップ")
        }else if(musicValue == 3) {
            soundPalyer.kawachiPlayer.stop()
            
            print("河内ストップ")
        }else if(musicValue == 4){
            soundPalyer.kaisatuPlayer.stop()
            print("改札ストップ")
        }
        
    }
    //大麻のカウントダウん
    func countDownTimer(){
        //経過時間の処理
        count += 1
        
        //時間が来たらタイマーを止める
        if Int(timerValue) - count <= 0 {
            //ここで停止する
            timerhandler?.invalidate()
            //アラートを表示する
            showAlert = true
            //複数回振動させる？　1秒
            for _ in 0...2{
                AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {}
                sleep(1)
            }
            
            
            //音楽を鳴らす
            if(musicValue == 1){
                soundPalyer.keikokuPlay()
                print("警告")
            } else if (musicValue == 2){
                soundPalyer.sentakuPlay()
                print("洗濯")
            }else if(musicValue == 3) {
                soundPalyer.kawachiPlay()
                
                print("ギター")
            }else if(musicValue == 4){
                soundPalyer.guitarPlay()
                print("改札")
            }
            
            
            
            
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]){
                (granted, error) in
                if granted {
                    self.makeNotification()
                }else {
                    //①通知が拒否されているという
                    print( "通知が拒否されているので発動できません")
                    //②１秒後に表示を元に戻しておく
                    //これもコンバイン
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        print ("5秒後にローカル通知を発行する")
                    }
                }
            }
        }
    }
    //大麻を開始する関数
    func startTimer() {
        //大麻使わせない
        enable = false
        //timerHandlreをアンラップして代入
        if let unwrapedTimeHander = timerhandler {
            //大麻が実行中ならスタートしない
            if unwrapedTimeHander.isValid == true {
                //実行させないためにリターンする
                return
            }
        }
        if Int(timerValue) - count <= 0 {
            
            count = 0
        }
        //タイマーを起動する
        timerhandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            //１秒毎に呼び出す
            self.countDownTimer()
            
        }
    }//startTimerここまで
    //①通知関係のメソッド作成
    func makeNotification(){
        //②通知タイミングを指定
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //③通知コンテンツの作成
        let content = UNMutableNotificationContent()
        content.title = "ローカル通知"
        content.body = "ローカル通知を発行しました"
        content.sound = UNNotificationSound.default
        
        //④通知タイミングと通知内容をまとめてリクエストを作成。
        let request = UNNotificationRequest(identifier: "MyTimerArrange0147", content: content, trigger: trigger)
        
        //⑤④のリクエストの通りに通知を実行させる
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    func playerStop(choice: Int){
        //音楽を止める
        if(musicValue == 1){
            soundPalyer.keikokuPlayer.stop()
            print("警告ストップ")
        } else if (musicValue == 2){
            soundPalyer.sentakuPlayer.stop()
            print("洗濯ストップ")
        }else if(musicValue == 3) {
            soundPalyer.kawachiPlayer.stop()
            
            print("河内ストップ")
        }else if(musicValue == 4){
            soundPalyer.kaisatuPlayer.stop()
            print("改札ストップ")
        }
    }
    
    func disMissions(){
        print("了解がタップされた")
        timerValue = 0
        count = 0
        enable = true
        //音楽を止める
        if(musicValue == 1){
            soundPalyer.keikokuPlayer.stop()
            print("警告ストップ")
        } else if (musicValue == 2){
            soundPalyer.sentakuPlayer.stop()
            print("洗濯ストップ")
        }else if(musicValue == 3) {
            soundPalyer.kawachiPlayer.stop()
            
            print("河内ストップ")
        }else if(musicValue == 4){
            soundPalyer.kaisatuPlayer.stop()
            print("改札ストップ")
        }
    }
    
}

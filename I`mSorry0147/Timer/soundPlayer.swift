//
//  soundPlayer.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/08.
//

import Foundation
import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    //音源てんぷれ
    let cymbalMusic = NSDataAsset(name: "cymbalSound")!.data
    
    //音源を扱うための変数 (入れ物)
    var cymbalPlayer: AVAudioPlayer!
    //音の制御
    var isPause = false
    
    //音を呼び出すときはfuncで呼ぶ？
    func cymbalPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            cymbalPlayer = try AVAudioPlayer(data: cymbalMusic)
            
            //音源を再生
            cymbalPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    
    
    //音源てんぷれ
    let guitarMusic = NSDataAsset(name: "guitarSound")!.data
    
    //音源を扱うための変数 (入れ物)
    var guitarPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func guitarPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            guitarPlayer = try AVAudioPlayer(data: guitarMusic)
            
            //音源を再生
            guitarPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    
    //音源てんぷれ
    let guitarMusic1 = NSDataAsset(name: "guitarSoundのコピー")!.data
    //音源を扱うための変数 (入れ物)
    var guitarPlayer1: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func guitarPlay1() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            guitarPlayer1 = try AVAudioPlayer(data: guitarMusic1)
            
            //音源を再生
            guitarPlayer1.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    
    //音源てんぷれ
    let guitarMusic2 = NSDataAsset(name: "guitarSoundのコピー2")!.data
    //音源を扱うための変数 (入れ物)
    var guitarPlayer2: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func guitarPlay2() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            guitarPlayer2 = try AVAudioPlayer(data: guitarMusic2)
            
            //音源を再生
            guitarPlayer2.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ
    let guitarMusic3 = NSDataAsset(name: "guitarSoundのコピー3")!.data
    //音源を扱うための変数 (入れ物)
    var guitarPlayer3: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func guitarPlay3() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            guitarPlayer3 = try AVAudioPlayer(data: guitarMusic3)
            
            //音源を再生
            guitarPlayer3.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ
    let doramMusic = NSDataAsset(name: "guitarSound")!.data
    
    //音源を扱うための変数 (入れ物)
    var doramPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func doramPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            doramPlayer = try AVAudioPlayer(data: doramMusic)
            
            //音源を再生
            doramPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ
    let noroiMusic = NSDataAsset(name: "呪いの旋律")!.data
    
    //音源を扱うための変数 (入れ物)
    var noroiPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func noroiPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            noroiPlayer = try AVAudioPlayer(data: noroiMusic)
            
            //音源を再生
            noroiPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ
    let wadaikoMusic = NSDataAsset(name: "和太鼓でドドン")!.data
    
    //音源を扱うための変数 (入れ物)
    var wadaikoPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func wadaikoPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            wadaikoPlayer = try AVAudioPlayer(data: wadaikoMusic)
            
            //音源を再生
            wadaikoPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ
    let kaisatuMusic = NSDataAsset(name: "駅改札口")!.data
    
    //音源を扱うための変数 (入れ物)
    var kaisatuPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func kaisatuPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            kaisatuPlayer = try AVAudioPlayer(data: kaisatuMusic)
            kaisatuPlayer.numberOfLoops = -1
            //音源を再生
            kaisatuPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ 音声を読み込む
    let gamecenterMusic = NSDataAsset(name: "ゲームセンター")!.data
    
    //音源を扱うための変数 (入れ物)
    var gamecenterPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func gamecenterPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            gamecenterPlayer = try AVAudioPlayer(data: gamecenterMusic)
            
            //音源を再生
            gamecenterPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ 音声を読み込む
    let saniburaunMusic = NSDataAsset(name: "saniburaun")!.data
    
    //音源を扱うための変数 (入れ物)
    var saniburaunPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func saniburaunPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            saniburaunPlayer = try AVAudioPlayer(data: saniburaunMusic)
            
            //音源を再生
            saniburaunPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ 音声を読み込む
    let dhiipMusic = NSDataAsset(name: "ディープラスト")!.data
    
    //音源を扱うための変数 (入れ物)
    var dhiipPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func dhiipPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            dhiipPlayer = try AVAudioPlayer(data: dhiipMusic)
            
            //音源を再生
            dhiipPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ 音声を読み込む
    let kawachiMusic = NSDataAsset(name: "河内の夢vs豊の意地")!.data
    
    //音源を扱うための変数 (入れ物)
    var kawachiPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func kawachiPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            kawachiPlayer = try AVAudioPlayer(data: kawachiMusic)
            //ループ再生　ここだと無限
            kawachiPlayer.numberOfLoops = -1
            //音源を再生
            kawachiPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ 音声を読み込む
    let mainichiMusic = NSDataAsset(name: "毎日王冠")!.data
    
    //音源を扱うための変数 (入れ物)
    var mainichiPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func mainichiPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            mainichiPlayer = try AVAudioPlayer(data: mainichiMusic)
            
            //音源を再生
            mainichiPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ 音声を読み込む
    let sigoMusic = NSDataAsset(name: "死後の世界")!.data
    
    //音源を扱うための変数 (入れ物)
    var sigoPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func sigoPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            sigoPlayer = try AVAudioPlayer(data: sigoMusic)
            
            if (isPause == false){
                //                    //音源を再生
                //                    sigoPlayer.play()
                //
                //                    isPause = true
                //                    print("開始")
            } else {
                //                    sigoPlayer.stop()
                print("止まれない")
            }
            
            
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ 音声を読み込む
    let keikokuMusic = NSDataAsset(name: "Warning-Siren01-1")!.data
    
    //音源を扱うための変数 (入れ物)
    var keikokuPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func keikokuPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            keikokuPlayer = try AVAudioPlayer(data: keikokuMusic)
            keikokuPlayer.numberOfLoops = -1
            //音源を再生
            keikokuPlayer.play()
        } catch {
            print("音源の設定エラー")
        }
        
    } //
    //音源てんぷれ 音声を読み込む
    let sentakuMusic = NSDataAsset(name: "洗濯機動作中")!.data
    
    //音源を扱うための変数 (入れ物)
    var sentakuPlayer: AVAudioPlayer!
    
    //音を呼び出すときはfuncで呼ぶ？
    func sentakuPlay() {
        //音源を扱うにはdo catchが必須
        do{
            //ここで音源を入れ物に入れる
            sentakuPlayer = try AVAudioPlayer(data: sentakuMusic)
            sentakuPlayer.numberOfLoops = -1
            //音源を再生
            sentakuPlayer.play()
            
        } catch {
            print("音源の設定エラー")
        }
        
    } //
}





//
//  SettingView.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/08.
//

import SwiftUI
import UserNotifications

extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),to: nil, from: nil, for: nil
        )
    }
}
//キーボードを止められる
extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct SettingView: View {
    //永続化する秒数設定
    @AppStorage("timer_value") var timerValue = 10
    
    
    var body: some View {
        
        
        
        ZStack{
            //背景色
            Color("backgroundSetting")
                //セーフエリア超えて全画面
                .edgesIgnoringSafeArea(.all)
                // ここが大事
                .onTapGesture {
                    // ここでキーボードを下げる
                                UIApplication.shared.endEditing()
                    print("test")
                }
            
            VStack{
                Spacer()
                //NumberFormatterが数字だけキーボード
                TextField("", value: $timerValue, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                //                Text("\(timerValue)秒")
                //                    .font(.largeTitle)
                
                Spacer()
                
                Picker(selection: $timerValue, label: Text("選択"), content: {
                    Text("はちみ").tag(10.0)
                    Text("20").tag(20.0)
                    Text("30").tag(30.0)
                    Text("40").tag(40.0)
                    Text("50").tag(50.0)
                    Text("60").tag(60.0)
                    
                })
                //スペースを開ける？
                Spacer()
            }
        }
        
        
        
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

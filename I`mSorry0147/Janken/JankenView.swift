//
//  JankenView.swift
//  I`mSorry0147
//
//  Created by cmStudent on 2022/07/04.
//

import SwiftUI

struct JankenView: View {
    @StateObject private var viewModel = JankenViewModel()
    
    var body: some View {
        VStack{
            //スペース追加
            Spacer()
            


            Text(viewModel.textbox)
                    .padding(.bottom)
            if viewModel.imageShow {
                Image(viewModel.Imagezo).resizable().aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.yellow)
            }

            //ジャンケン実行？ボタン
            Button(action:{//押したときの反応
                
                //起動時の処理?
                viewModel.startTimer()

                
            })
            {//ボタンの見た目？
                Text("ジャンケンをする")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    
            }
        }
       
        
    }
    
}

struct JankenView_Previews: PreviewProvider {
    static var previews: some View {
        JankenView()
    }
}


//
//  ContentView.swift
//  DesignCode
//
//  Created by 李瑞华 on 2020/11/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
            }
            .frame(width: 300, height: 200)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(x: 0, y: -20)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("UI Design")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                        Text("Certificate")
                            .foregroundColor(Color("accent"))
                    }
                    Spacer()
                    Image("Logo1")
                }
                //两侧的边距
                .padding(.horizontal, 20)
                //顶部边距
                .padding(.top, 20)
                Spacer()
                Image("Card1")
                    //使图像可修改大小
                    .resizable()
                    //图像截取的模式 .fill 选取宽高的较小值进行缩放，会有一部分图片被截断 .fit 选取宽高的较大值进行缩放，容器无法装满时，出现留白
                    .aspectRatio(contentMode: .fit)
                    //设置图片容器大小
                    .frame(width: 300, height: 110, alignment: .top)
            }
            .frame(width: 340, height: 220)
            .background(Color.black)
            .cornerRadius(20)
            .shadow(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  Home.swift
//  DesignCode
//
//  Created by 李瑞华 on 2020/12/14.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            //设置根视图的背景颜色，而不是在外层利用background 确保背景颜色只用于根视图
            Color("background2")
                //禁用安全区域
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            HomeView(showProfile: $showProfile)
                //移出安全区域
                .padding(.top, 44)
                .background(Color("background1"))
                //圆角矩形切割
                .clipShape(RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
                .offset(y: showProfile ? -450 : 0)
                //3D效果
                .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0.0, z: 0.0))
                //缩放
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            MenuView()
                //添加一个近乎透明的背景，用于点击切换menu是否显示
                .background(Color.black.opacity(0.0001))
                .offset(y: showProfile ? 0 : screen.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged{value in
                        viewState = value.translation
                    }
                    .onEnded({ value in
                        if viewState.height > 50 {
                            showProfile = false
                        }
                        viewState = .zero
                    })
                )
            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        
        Home()
//                Home()
//                   .preferredColorScheme(.dark)
    }
}



let screen = UIScreen.main.bounds

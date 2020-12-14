//
//  Home.swift
//  DesignCode
//
//  Created by 李瑞华 on 2020/12/14.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            //设置根视图的背景颜色，而不是在外层利用background 确保背景颜色只用于根视图
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                //禁用安全区域
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: { showProfile.toggle() }) {
                        Image("Avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
            //移出安全区域
            .padding(.top, 44)
            .background(Color.white)
            //圆角矩形切割
            .clipShape(RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
            .offset(y: showProfile ? -450 : 0)
            //3D效果
            .rotation3DEffect(Angle(degrees: showProfile ? -10 : 0), axis: (x: 10.0, y: 0.0, z: 0.0))
            //缩放
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

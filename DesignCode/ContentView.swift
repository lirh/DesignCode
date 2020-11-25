//
//  ContentView.swift
//  DesignCode
//
//  Created by 李瑞华 on 2020/11/17.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            TitleView()
                //增加模糊
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            BackCardView()
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -140 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(
                    .degrees(10),
                    axis: (x: 10.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)
                //增加动画，以及延时
                .animation(.easeInOut(duration: 0.4))
            
            BackCardView()
                .background(show ? Color("card4") :Color("card1"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -60 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5))
                .rotation3DEffect(
                    .degrees(5),
                    axis: (x: 10.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)
                //增加动画，以及延时
                .animation(.easeInOut(duration: 0.2))
            
            CardView()
                .offset(x: viewState.width, y: viewState.height)
                .blendMode(.hardLight)
                //.spring(response 延时，dampingFraction 阻力
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                //点击事件
                .onTapGesture {
                    show.toggle()
                }
                .gesture(
                    //拖拽手势
                    DragGesture().onChanged { value in
                        //存储位置信息
                        viewState = value.translation
                        show = true
                    }
                    .onEnded{ value in
                        viewState = .zero
                        show = false
                    }
                )
            
            BottomCardView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
                .offset(x: 0.0, y: show ? 2000 : 600)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

struct CardView: View {
    var body: some View {
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
                .aspectRatio(contentMode: .fill)
                //设置图片容器大小
                .frame(width: 300, height: 110, alignment: .top)
        }
        .frame(width: 340, height: 220)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340, height: 220)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                //多行文本的对齐
                .multilineTextAlignment(.center)
                .font(.subheadline)
                //行距
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal,20)
        //将宽度设置为最大宽度
        .frame(maxWidth:.infinity)
        .background(Color("background3"))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

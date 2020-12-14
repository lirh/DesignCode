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
    @State var showCard = false
    
    var body: some View {
        ZStack {
            TitleView()
                //增加模糊
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -100 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.2)
//                        .speed(2)
                )
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -140 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(
                    .degrees(showCard ? 0 :10),
                    axis: (x: 10.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)
                //增加动画，以及延时
                .animation(.easeInOut(duration: 0.4))
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color("card4") :Color("card1"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -60 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(
                    .degrees(showCard ? 0 : 5),
                    axis: (x: 10.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)
                //增加动画，以及延时
                .animation(.easeInOut(duration: 0.2))
            
            CardView()
                .frame(width: showCard ? 375 : 340, height: 220)
                .background(Color.black)
//                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                //.spring(response 延时，dampingFraction 阻力
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                //点击事件
                .onTapGesture {
                    showCard.toggle()
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
                .offset(x: 0.0, y: showCard ? 80 : 300)
                .offset(x: 0.0, y: show ? 3000 : 300)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                
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
       
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
       
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

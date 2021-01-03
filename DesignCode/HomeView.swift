//
//  HomeView.swift
//  DesignCode
//
//  Created by 李瑞华 on 2021/1/3.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("secondary"))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.top, 30)
           
            //showsIndicators 是否显示滚动条
            ScrollView (.horizontal, showsIndicators: false){
                HStack {
                    ForEach(sectionData) {item in
                        SectionView(section: item)
                    }
                }
                .padding(30)
                .padding(.bottom,30)
            }
            
            
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity,alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top,20)
        .padding(.horizontal,20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
    }
}

//数据模型
struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Prototype designs in SwiftUI", text: "18, Sections", logo: "Logo1", image: Image("Card1"), color: Color("card1")),
    Section(title: "Build a SwiftUI app", text: "18, Sections", logo: "Logo1", image: Image("Card2"), color: Color("card2")),
    Section(title: "Build a SwiftUI app", text: "18, Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card1")), color: Color("card3")),
    Section(title: "Build a SwiftUI app", text: "18, Sections", logo: "Logo2", image: Image("Card4"), color: Color("card4")),
    Section(title: "Build a SwiftUI app", text: "18, Sections", logo: "Logo2", image: Image("Card5"), color: Color("card5")),
    Section(title: "Build a SwiftUI app", text: "18, Sections", logo: "Logo2", image: Image("Card6"), color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
]

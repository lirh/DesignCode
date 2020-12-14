//
//  MenuView.swift
//  DesignCode
//
//  Created by 李瑞华 on 2020/12/14.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign out", icon: "person.crop.circle")
            }
            //最大宽度
            .frame(maxWidth: .infinity)
            //高度
            .frame(height: 300)
            .background(Color.white)
            //圆角矩形切割
            .clipShape(RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            .shadow(radius: 30)
            //内边距
            .padding(.horizontal,30)
        }
        //底边距
        .padding(.bottom,30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack (spacing: 16){
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                //图像比例 大、中、小
                .imageScale(.large)
                .frame(width: 32, height: 32)
         
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}

//
//  Modifiers.swift
//  DesignCode
//
//  Created by 李瑞华 on 2021/1/5.
//

import SwiftUI

//MARK: 双重阴影
struct ShaodowMidifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
    }
}

//MARK: 文字样式
struct FontModifier: ViewModifier {
    var style: Font.TextStyle = .body
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .default))
    }
}

//MARK: 文字字体
struct CustomFontModifier: ViewModifier {
    var size: CGFloat = 28
    func body(content: Content) -> some View {
        content.font(.custom("WorkSans-Bold", size: size))
    }
}

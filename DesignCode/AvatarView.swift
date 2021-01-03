//
//  AvatarView.swift
//  DesignCode
//
//  Created by 李瑞华 on 2021/1/3.
//

import SwiftUI


struct AvatarView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: { showProfile.toggle() }) {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(showProfile: .constant(false))
    }
}


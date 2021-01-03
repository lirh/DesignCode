//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by 李瑞华 on 2021/1/3.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[0]
    
    var body: some View {
        ScrollView {
            VStack {
                Divider()
                Image(update.image)
                    .resizable()
                    .frame(maxWidth:.infinity)
                
                Divider()
            
                Text(update.text)
                    .frame(maxWidth:.infinity, alignment: .leading)

                
                Divider()
            }
            .navigationBarTitle(update.title)
            .padding(.horizontal, 20)
        }
//        .listStyle(GroupedListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}

//
//  RingView.swift
//  DesignCode
//
//  Created by 李瑞华 on 2021/1/3.
//

import SwiftUI

struct RingView: View {
    var color1 = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
    var color2 = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
    var width: CGFloat = 88
    var height: CGFloat = 88
    var percent: CGFloat = 88
    
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
        ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .leading, endPoint: .trailing),
                    style: StrokeStyle(lineWidth: 5 * multiplier,
                                       lineCap: .round,
                                       lineJoin: .round,
                                       miterLimit: .infinity,
                                       dash: [20,0],
                                       dashPhase: 0)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1.0, y: 0, z: 0.0)
                )
                .frame(width: width, height: height)
                .shadow(color: Color(color2), radius: 3 * multiplier, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3 * multiplier)
                
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
                }
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(width: 88, height: 88, percent: 22, show: .constant(true))
    }
}

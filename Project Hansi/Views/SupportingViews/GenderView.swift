//
//  GenderView.swift
//  Project Hansi
//
//  Created by NIBM-LAB04-PC15 on 2024-03-28.
//

import SwiftUI

struct GenderView: View {
    var isSelected:Bool = true
    var title:String = "WOMEN"
    
    var body: some View {
        VStack(spacing: 1){
            Text(title)
                .font(Font.custom("Tenor Sans", size: 15))
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? Color.orange: Color.Placeholder.opacity(0.9))
            
            if isSelected {
                ZStack{
                    Rectangle()
                        .foregroundColor(Color.orange)
                        .frame(height: 1)
                    
                    Rectangle()
                        .foregroundColor(Color.orange)
                        .frame(width: 5, height: 5)
                        .rotationEffect(Angle(degrees: 45))
                }
            }else{
                Divider()
            }
        }
    }
}


struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView()
    }
}

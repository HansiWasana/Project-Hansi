//
//  CategoryView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-27.
//

import SwiftUI

struct CategoryView: View {
    var isSelected:Bool = false
    var title: String = "All"
    var body: some View {
        VStack(spacing: 1) {
            Text(title)
                .font(Font.custom("Tenor Sans", size:  20))
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? Color.Default : Color.Placeholder.opacity(0.5))
            
            if isSelected {
                Rectangle ()
                    .foregroundColor(Color.Default)
                    .frame(width: 5, height: 45)
                    .rotationEffect(Angle(degrees: 45))
                
                
            }
        }
    }
    
}
    

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

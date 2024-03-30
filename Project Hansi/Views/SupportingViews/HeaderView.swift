//
//  HeaderView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-27.
//

import SwiftUI


struct HeaderView:View {
    
    var menuAction: ButtonAction
    var cartAction: ButtonAction
    
    

    var body: some View {
        ZStack{
            HStack {
                Button {
                    menuAction()
                } label: {
                    Image(systemName: "line.horizontal.3")
                    
                        .imageScale(.large)
                        .padding()
                    //.frame(width: 50,height: 70)
                    //.overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                   
                    NavigationLink {
                        HomeView()
                    }label: {
                        
                    }
                    Text("Dock's N Dazzle")
                        .font(Font.custom("Tenor Sans", size: 20))
                        .padding(.trailing)
                        .foregroundColor(.black)
            }
                
                
                
                Button {
                    cartAction()
                } label: {
                    Image(systemName: "bag")

                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
                
                .frame(width: 24, height: 24)
                .frame(maxWidth:  .infinity, alignment:  .trailing)
                
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background()
    }
}
    
    


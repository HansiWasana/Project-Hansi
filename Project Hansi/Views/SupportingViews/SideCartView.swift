//
//  SideCartView.swift
//  Project Hansi
//
//  Created by NIBM-LAB04-PC15 on 2024-03-28.
//

import SwiftUI

struct SideCartView: View {
    @State var presentSideMenu = true
    
    var body: some View {
        ZStack{
            SideCartMenu()
        }
        .background(.black)
    }

            @ViewBuilder
            private func SideCartMenu() -> some View {
            //    SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presenSideMenu: $presentSideMenu)), direction: .leading)
                
            }
}

struct SideCartViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        SideCartView()
    }
}


struct SideCartViewContents: View {
    @Binding var presentSideMenu: Bool
    @State private var totalPrice:Int = 0
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                    
                }label: {
                Image("Close")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 34, height: 34)
                Spacer()
            }
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding(.leading, 10)
        .padding(.top, 40)
        .padding(.bottom, 30)
    }
    
}

//
//  SideMenuView.swift
//  Project Hansi
//
//  Created by NIBM-LAB04-PC15 on 2024-03-28.
//

import SwiftUI

struct SideMenuViewTemp: View {
    @State var presentSideMenu = true
    var body: some View {
        ZStack {
            SideMenuView()
            
        }.background(.black)
    }
    
    @ViewBuilder
    private func SideMenuView() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presenSideMenu: $presentSideMenu)), direction: .leading)
        
    }
}

struct SideMenuViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuViewTemp()
    }
}

struct SideMenuViewContents: View {
    @Binding var presenSideMenu:Bool
    
    var categories = [Categories.All.rawValue, Categories.Appareal.rawValue, Categories.Dress.rawValue, Categories.TShirt.rawValue]
    
    @State private var selectedCategory : Int = 0
    
    var body: some View {
        HStack{
            ZStack{
                VStack(alignment: .leading) {
                    SideMenuTopView()
                    HStack(spacing: 10) {
                        
                    }
                    Spacer()
                }
            }
            
        }.padding([.leading, .trailing], 20)
    }
    
    func SideMenuTopView() -> some View {
        VStack {
            HStack {
                Button{
                    presenSideMenu.toggle()
                    
                }label: {
                    Image("Close")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 34, height: 34)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 10)
            .padding(.top, 40)
            .padding(.bottom, 30)
        }
    }


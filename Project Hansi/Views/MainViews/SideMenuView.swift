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
    
    var categories = [Categories.All.rawValue, Categories.Appareal.rawValue, Categories.Dress.rawValue, Categories.TShirt.rawValue ,Categories.Bag.rawValue]
    
    @State private var selectedCategory : Int = 0
    
    var body: some View {
        HStack{
            ZStack{
                VStack(alignment: .leading) {
                    SideMenuTopView()
                    HStack(spacing: 10) {
                        GenderView(isSelected: selectedCategory == 0, title: "WOMEN")
                        .onTapGesture {
                            selectedCategory = 0
                        }
                        GenderView(isSelected: selectedCategory == 1, title:  "MEN")
                            .onTapGesture {
                                selectedCategory = 1
                            }
                        GenderView(isSelected:  selectedCategory == 2, title: "KIDS")
                            .onTapGesture {
                                selectedCategory = 2
                            }
                        
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    ForEach(0..<categories.count ,id:\.self){ i in
                        CategoryItem(title: categories[i] ){
                            
                        }
                    }
                    Spacer()
                    
                    Button {
                        
                    }label: {
                        HStack{
                            Image("cell")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:  24, height: 24)
                            Text("(7749) XXX-8755")
                                .font(Font.custom("Tenor Sans", size: 16))
                                .foregroundColor(.black)
                            
                               
                        }
                        .padding(.leading, 30)
                        .padding(.top ,20)
                    }
                    
                    Button {
                        
                    }label: {
                        HStack{
                            Image("Location")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:  24, height: 24)
                            Text("Store locator")
                                .font(Font.custom("Tenor Sans", size: 16))
                                .foregroundColor(.black)
                            
                               
                        }
                        .padding(.leading, 30)
                        .padding(.top ,20)
                    }
                    
                    Rectangle()
                        .foregroundColor(Color.gray)
                        .frame(width:  300, height: 0.5)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(.top, 20)
                    
                    HStack(spacing: 30) {
                        
                        Spacer()
                        Image("Twitter")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:  24, height: 24)
                        Image("Youtube")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:  24, height: 24)
                        Image("Instragram")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:  24, height: 24)
                        
                        Spacer()
                        

                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
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
    
    @ViewBuilder
    func  CategoryItem(title: String, action: @escaping (() -> Void)) ->
    some View {
        Button {
            action()
        }label: {
            VStack(alignment: .leading) {
                Text(title)
                    .font(Font.custom("Tenor Sans", size: 16))
                    .foregroundColor(.black)
            }
        }
        .frame(height: 50)
        .padding(.leading, 30)
        .padding(.top, 10)
    }
}


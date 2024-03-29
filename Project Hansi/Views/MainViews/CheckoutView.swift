//
//  CheckoutView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-29.
//

import SwiftUI

struct CheckoutView: View {
    
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack{
                VStack(spacing: 0) {
                    Text("CHECKOUT")
                        .font(Font.custom("Tenor Sans", size: 20))
                        .kerning(4)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(height:  32, alignment: .center)
                    
                    Rectangle()
                        .foregroundColor(Color.gray)
                        .frame(width:  300, height: 0.5)
                        .padding(15)
                    
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(0..<cartItems.count, id: \.self) { i in
                                if cartItems[i].count > 0 {
                                    CartItemView(item:cartItems[i]) {
                                         
                                    }
                                }
                                
                            }
                        }
                    }.padding([.leading, .trailing],20)
                    
                    VStack(alignment: .leading, spacing: 15){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 343,height: 1)
                            .background(Color.black)
                        
                        Button{
                            
                        }label: {
                            HStack{
                                Image("Door to door Delivery")
                                    .resizable()

                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                                
                                Text("Add promo code")
                                    .font(Font.custom("Tenor Sans", size: 18))
                                    .foregroundColor(.gray)
                                
                                
                            }
                            
                        }
                        
                    }
                    
                    Rectangle()
                        .foregroundColor(Color.gray)
                        .frame(width:  300, height: 0.5)
                        .padding(15)
                    
                    
                    
                }
                .padding(.top, 90)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .top){
                    HeaderView {
                        presentSideMenu.toggle()
                        
                    } cartAction: {
                        presentSideCart.toggle()
                    }
                    
                }
                
                SideMenu()
                SideCart()
                
                
            }
            
        }
    }
    
    @ViewBuilder
    private func SideMenu()-> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presenSideMenu: $presentSideMenu)), direction: .leading)
        
    }
    
    @ViewBuilder
    private func SideCart()-> some View {
        SideView(isShowing: $presentSideCart, content:
                    AnyView(SideCartViewContents(presentSideMenu:$presentSideCart)), direction: .trailing)
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}

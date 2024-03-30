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
    
    @State private var totalPrice: Int = 0
    
    var body: some View {
        
            ZStack{
                
                MainCartView()
                //PaymentSuccessView()
                
            }
            .onAppear{
                updateCartValue()
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationBarHidden(true)
        }
    
    @ViewBuilder
    private func MainCartView()-> some View {
        Color.white.edgesIgnoringSafeArea(.all)
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
                                updateCartValue()
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
                        Image("voucher")
                            .resizable()
                        
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 27)
                        
                        Text("Add promo code")
                            .font(Font.custom("Tenor Sans", size: 18))
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                }
                Rectangle()
                    .foregroundColor(Color.gray)
                    .frame(width:  300, height: 0.5)
                    .padding(15)
                
                Button{
                    
                }label: {
                    HStack{
                        Image("Door")
                            .resizable()
                        
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 27)
                        
                        Text("Delivery")
                            .font(Font.custom("Tenor Sans", size: 18))
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                }
                
                
            }
            
            Rectangle()
                .foregroundColor(Color.gray)
                .frame(width:  300, height: 0.5)
                .padding(15)
            Spacer()
            
            HStack(alignment: .bottom){
                Text("EST. TOTAL")
                    .font(Font.custom("Tenor Sans", size: 16))
                    .kerning(2)
                    .foregroundColor(.black)
                
                Spacer()
                
                
                Text("$\(totalPrice)")
                    .font(Font.custom("Tenor Sans", size: 25))
                
                
                
            }
            .padding([.leading, .trailing], 20)
            .frame(height: 80)

            
            NavigationLink{
                PaymentSuccessView()
            }label: {
                HStack {
                  
                        Image(systemName: "bag")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .colorInvert()
                        Text("PLACE ORDER")
                            .font(Font.custom("Tenor Sans", size: 16))
                            .kerning(0.16)
                            .multilineTextAlignment(.center)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                    }
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                }
        

            
            
//            NavigationView {
//                Button(action: {
//                    // No need for action here if NavigationLink handles the navigation
//                }) {
//                    NavigationLink(destination: NavigationView {
//                        ProductList()
//                    }) {
//                        Text("Shop men's")
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(Color.black)
//                            .cornerRadius(10)
//                            .padding(.horizontal, 2)
//                            .frame(width: 200)
//                    }
//                }
//            }

            
        }
        .padding(.top, 36)
        
        
    
    
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
    
    @ViewBuilder
    private func PaymentSuccessView()-> some View {
        ZStack{
            Color.gray.opacity(0.91).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 10) {
                Text("PAYMENT SUCCESS")
                    .font(Font.custom("Tenor Sans", size: 20))
                    .kerning(4)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                    Image("SuccessComplete")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                
                Text("Your payment was success")
                    .font(Font.custom("Tenor Sans", size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                Text("Payment ID \(123456)")
                    .font(Font.custom("Tenor Sans", size: 17))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                
                
                Button{
                    
                }label: {
                    HStack{
                        Text("BACK TO HOME")
                            .font(Font.custom("Tenor Sans", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .overlay {
                        Rectangle()
                            .inset(by:0)
                            .stroke(Color.white.opacity(0.8),
                                    lineWidth: 1)
                        
                    }
                    .padding([.top, .bottom], 20)
                }
                
            }
            .frame(width:  350, height: 300)
         //   .frame(maxWidth: .infinity)
            .background(.white)
            
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
    
    func updateCartValue() {
        print("\(totalPrice)")
          var value: Int = 0
          for item in cartItems {
              value += (item.count * item.product.price)
          }
          totalPrice = value
      }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}

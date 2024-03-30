//
//  SplashView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-29.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: HomeView()) {
                Image("splashview")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(width: 200, height: 900)
            }

        }
    }
}




struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

//
//  Onboarding.swift
//  alCool Project
//
//  Created by Alessandro Antonino Russo on 26/10/22.
//

import SwiftUI

struct Onboarding: View {
    @Binding var shouldShowOnboarding: Bool
    @Binding var skipButton: Bool
    var body: some View {
        TabView {
            PageView (title: "Welcome!",
                      subtitle: "It’s time to get creative and have fun together!",
                      imagename: "Key",
                      showDismissButton: false,
                      showSkipButton: true,
                      shouldShowOnboarding: $shouldShowOnboarding,
                      skipButton: $skipButton)
                      
            
            PageView (title: "Create your Story.\nAdd photos, riddles and hints",
                      subtitle: "Unleash your fantasy!",
                      imagename: "CreationSession",
                      showDismissButton: false,
                      showSkipButton: true,
                      shouldShowOnboarding: $shouldShowOnboarding,
                      skipButton: $skipButton)
                     
         
            PageView (title: "Get immersed in someone else’s story",
                      subtitle: "Solve a sequence of enigmas together with your peers.\nReady to play?",
                      imagename: "GameSession",
                      showDismissButton: true,
                      showSkipButton: false,
                      shouldShowOnboarding: $shouldShowOnboarding,
                      skipButton: $skipButton)
            
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black)
    }
}

struct PageView: View {
    let title: String
    let subtitle: String
    let imagename: String
    let showDismissButton: Bool
    let showSkipButton: Bool


    @Binding var shouldShowOnboarding: Bool
    @Binding var skipButton: Bool
    var body: some View {
        VStack {

            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .topLeading)

            Image(imagename)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 150)

                Text(subtitle)
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .topLeading)
            
            if showSkipButton {
                Button(action: {
                    shouldShowOnboarding.toggle()
                }, label: {
                    Text("Skip")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color("AccentColor"))
                        .cornerRadius(6)
                })
            }

            if showDismissButton {
                Button(action: {
                    shouldShowOnboarding.toggle()
                }, label: {
                    Text("Get Started!")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color("AccentColor"))
                        .cornerRadius(6)
                })
            }
        }
        .foregroundColor(Color.white)

    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(shouldShowOnboarding: .constant(true), skipButton: .constant(true))
            .preferredColorScheme(.dark)
    }
}

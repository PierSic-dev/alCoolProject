//
//  Onboarding.swift
//  alCool Project
//
//  Created by Alessandro Antonino Russo on 26/10/22.
//

import SwiftUI

struct Onboarding: View {
    @State var ShouldShowOnboarding: Bool = true
    @State var SkipButton: Bool = true
    var body: some View {
        NavigationView {
            VStack {
                Text("It's time to get creative and have fun togheter!")
            }
            .navigationTitle("Welcome!")
        }
        .fullScreenCover(isPresented: $ShouldShowOnboarding, content: {
            OnboardingView(ShouldShowOnboarding: $ShouldShowOnboarding, SkipButton: $SkipButton)
        } )
    }
}

// Onboarding
struct OnboardingView: View {
    @Binding var ShouldShowOnboarding: Bool
    @Binding var SkipButton: Bool
    var body: some View {
        TabView {
            PageView (title: "Welcome!",
                      subtitle: "It’s time to get creative and have fun together!",
                      imagename: "bell",
                      showDismissButton: false,
                      showSkipButton: true,
                      ShouldShowOnboarding: $ShouldShowOnboarding,
                      SkipButton: $SkipButton)
                      
            
            PageView (title: "Create your Story.\nAdd photos, riddles and hints",
                      subtitle: "Unleash your fantasy!",
                      imagename: "bookmark",
                      showDismissButton: false,
                      showSkipButton: true,
                      ShouldShowOnboarding: $ShouldShowOnboarding,
                      SkipButton: $SkipButton)
                     
         
            PageView (title: "Get immersed in someone else’s story",
                      subtitle: "Solve a sequence of enigmas together with your peers.\nReady to play?",
                      imagename: "house",
                      showDismissButton: true,
                      showSkipButton: false,
                     ShouldShowOnboarding: $ShouldShowOnboarding,
                      SkipButton: $SkipButton)
            
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


    @Binding var ShouldShowOnboarding: Bool
    @Binding var SkipButton: Bool
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 32))
                .fontWeight(.medium)
                .padding()

            Image(systemName: imagename)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
           
            
            Text(subtitle)
                .font(.system(size: 24))
                .padding()
            
            if showSkipButton {
                Button(action: {
                    SkipButton.toggle()
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
                    ShouldShowOnboarding.toggle()
                }, label: {
                    Text("Get Started!")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(6)
                })
            }
        }
    }
}
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
            .preferredColorScheme(.dark)
    }
}

struct pageControl : UIViewRepresentable {
    var current = 0
    
    func makeUIView(context: UIViewRepresentableContext<pageControl>) -> UIPageControl {
        
        let page = UIPageControl()
        page.currentPageIndicatorTintColor = .black
        page.numberOfPages = 4
        page.pageIndicatorTintColor = .gray
        return page
    }
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<pageControl>) {
        
        uiView.currentPage = current
    }
    }

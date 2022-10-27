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
            PageView (title: "Push notification",
                      subtitle: "Enable notification",
                      imagename: "bell",
                      showDismissButton: false,
                      showSkipButton: true,
                      Currentpage: 0,
                      ShouldShowOnboarding: $ShouldShowOnboarding,
                      SkipButton: $SkipButton)
            
            PageView (title: "Bookmarks",
                      subtitle: "Save your favourite",
                      imagename: "bookmark",
                      showDismissButton: false,
                      showSkipButton: true,
                      Currentpage: 1,
                      ShouldShowOnboarding: $ShouldShowOnboarding,
                      SkipButton: $SkipButton)
            
            PageView (title: "Flights",
                      subtitle: "Book flights",
                      imagename: "airplane",
                      showDismissButton: false,
                      showSkipButton: true,
                      Currentpage: 2,
                      ShouldShowOnboarding: $ShouldShowOnboarding,
                      SkipButton: $SkipButton)
            
            PageView (title: "Home",
                      subtitle: "Return Home",
                      imagename: "house",
                      showDismissButton: true,
                      showSkipButton: false,
                      Currentpage: 3,
                      ShouldShowOnboarding: $ShouldShowOnboarding,
                      SkipButton: $SkipButton)
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View {
    let title: String
    let subtitle: String
    let imagename: String
    let showDismissButton: Bool
    let showSkipButton: Bool

    @State var Currentpage: Int
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
                .frame(width: 150.0, height: 150.0)
                .padding()
            
           
            
            Text(subtitle)
                .font(.system(size: 24))
                .foregroundColor(Color(.secondaryLabel))
                .padding()
            
        
            pageControl(current: Currentpage)
            
            if showSkipButton {
                Button(action: {
                    SkipButton.toggle()
                }, label: {
                    Text("Skip")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
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

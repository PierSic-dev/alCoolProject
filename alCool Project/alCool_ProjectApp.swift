//
//  alCool_ProjectApp.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 22/10/22.
//

import SwiftUI

@main
struct alCool_ProjectApp: App {
    @State var ShouldShowOnboarding: Bool = true
    @State var SkipButton: Bool = true
    
    var body: some Scene {
        WindowGroup {
            StoriesView()
                .preferredColorScheme(.dark)
        }
    }
}

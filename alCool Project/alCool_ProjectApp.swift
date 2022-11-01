//
//  alCool_ProjectApp.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 22/10/22.
//

import SwiftUI

@main
struct alCool_ProjectApp: App {
    @State var shouldShowOnboarding: Bool = true
    @State var skipButton: Bool = true
    
    var body: some Scene {
        WindowGroup {
            StoriesView(shouldShowOnboarding: $shouldShowOnboarding, skipButton: $skipButton)
                .preferredColorScheme(.dark)
        }
    }
}

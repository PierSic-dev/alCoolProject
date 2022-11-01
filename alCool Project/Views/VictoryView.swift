//
//  VictoryView.swift
//  alCool Project
//
//  Created by Arturo Alfani on 02/11/22.
//

import SwiftUI

struct VictoryView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Victory!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 150)

            Image("Key")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 450)

//                Text("Well done")
//                .font(.title2)
//                .padding()
//                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .center)
            
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Back to Story")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color("AccentColor"))
                        .cornerRadius(6)
                })

        }
        .foregroundColor(Color.white)
    }
}

struct VictoryView_Previews: PreviewProvider {
    static var previews: some View {
        VictoryView().preferredColorScheme(.dark)
    }
}

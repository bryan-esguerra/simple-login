//
//  WelcomeView.swift
//  sampleLogin
//
//  Created by Robert Bryan Esguerra on 7/8/24.
//

import SwiftUI

struct WelcomeView: View {
    let viewModel : WelcomeViewModel
    
    var body: some View {
        VStack {
            Text("Welcome back! \n \(viewModel.firstName) \(viewModel.lastName)!")
                .font(.largeTitle)
                .padding(.top, 30)
                .padding([.leading, .trailing], 15)
            Spacer()
        }
        .navigationBarTitle("Welcome", displayMode: .inline)
    }
}



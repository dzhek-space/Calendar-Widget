//
//  WelcomeView.swift
//  SimpleCalendar
//
//  Created by Dzhek on 04.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            AboutAppView()
            DividerGroup()
                .opacity(0.5)
            AboutInstalView()
                .opacity(0.8)
            DividerGroup()
                .opacity(0.5)
            AboutAuthorView()
                .opacity(0.6)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

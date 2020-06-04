//
//  AboutAppView.swift
//  SimpleCalendar
//
//  Created by Dzhek on 04.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import SwiftUI

struct AboutAppView: View {
    var body: some View {
        VStack(spacing: 32) {
            Image("iconSet")
                .resizable()
                .frame(width: 96, height: 96)
            VStack(spacing: 8) {
                Text("Simple Сalendar")
                    .font( .system(.title, design: .rounded))
                Text("macOS Today Widget")
                    .font(.subheadline)
                    .fontWeight(.light)
            }
        }
    }
}


#if DEBUG
struct AboutAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAppView()
    }
}
#endif

//
//  AboutInstalView.swift
//  SimpleCalendar
//
//  Created by Dzhek on 04.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import SwiftUI

struct AboutInstalView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("How to add")
                .font(.headline)
            Text("open the Notification Center")
            HStack {
                Text("click")
                Text("Edit")
                    .foregroundColor(Color.white)
                    .fontWeight(.regular)//.opacity(1)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 2)
                    .background(RoundedRectangle(cornerRadius: 3, style: .continuous).opacity(0.8))
                    .cornerRadius(3)
                Text("at the bottom")
            }
            HStack {
                Text("click")
                ZStack(alignment: .center) {
                    Circle()
                        .fill(Color.green)
                    Text("＋")//⊕
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 1)
                    }
                    .frame(width: 16, height: 16)
                Text(#"next to "Friday Сalendar""#)
            }
            HStack {
                Text("🎉")
                Text("life is now a little easier")
                    .fontWeight(.light)
                Text("🎉")
                    .rotation3DEffect(Angle(degrees: 180),
                                      axis: (x: 0, y:1.0, z: 0))
            }
        }
        .font(.system(size: 14, weight: .light))
    }
}


#if DEBUG
struct AboutInstalView_Previews: PreviewProvider {
    static var previews: some View {
        AboutInstalView()
    }
}
#endif

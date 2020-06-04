//
//  AboutAuthorView.swift
//  SimpleCalendar
//
//  Created by Dzhek on 04.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import SwiftUI

struct AboutAuthorView: View {
    var body: some View {
        VStack {
            Text("life ❤ code ❤ ease")
            Text("dzhek.space")
        }
        .font(.system(size: 12, weight: .thin, design: .monospaced))
    }
}


#if DEBUG
struct AboutAuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAuthorView()
    }
}
#endif

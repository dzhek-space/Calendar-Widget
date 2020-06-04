//
//  DividerGroup.swift
//  SimpleCalendar
//
//  Created by Dzhek on 04.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import SwiftUI

struct DividerGroup: View {
    var body: some View {
        Group {
            Spacer()
            Divider()
                .background(Color("accent").opacity(0.3))
                .padding(.horizontal, 32)
            Spacer()
        }
    }
}


#if DEBUG
struct DividerGroup_Previews: PreviewProvider {
    static var previews: some View {
        DividerGroup()
    }
}
#endif

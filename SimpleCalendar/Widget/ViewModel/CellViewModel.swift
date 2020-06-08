//
//  CellViewModel.swift
//  Widget
//
//  Created by Dzhek on 08.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Foundation

struct CellViewModel {
    let kind: CellViewModel.Kind
    let value: String
    
}


// MARK: - Kind of Cell

extension CellViewModel {
    
    enum Kind {
        case weekdaySymbol
        case numberWeek
        case weekday
        case weekend
        case today
        case extraday
        
    }
    
}

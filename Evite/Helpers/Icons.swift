//
//  Icons.swift
//  Evite
//
//  Created by Brian Hersh on 9/2/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation
import SwiftUI

enum Icons {
    case personCircle
    case dollarsignCircle
    case calendar
    case location
    case elipses
    case houseFill
    case magnifyingGlass
    case plusCircle
    case bell
    case person
    
    var image: Image {
        switch self {
        case .personCircle: return Image(systemName: "person.crop.circle.fill")
        case .dollarsignCircle: return Image(systemName: "dollarsign.circle")
        case .calendar: return Image(systemName: "calendar")
        case .location: return Image(systemName: "location")
        case .elipses: return Image(systemName: "ellipsis")
        case .houseFill: return Image(systemName: "house.fill")
        case .magnifyingGlass: return Image(systemName: "magnifyingglass")
        case .plusCircle: return Image(systemName: "plus.circle")
        case .bell: return Image(systemName: "bell")
        case .person: return Image(systemName: "person")
        }
    }
}

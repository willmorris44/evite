//
//  Color+.swift
//  Evite
//
//  Created by Brian Hersh on 9/2/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static var primary: Color  {
        return Color("primary")
    }
    
    static var secondary: Color  {
        return Color("secondary")
    }
    
    static var highlights: Color  {
        return Color("highlights")
    }
}

extension UIColor {
    static var primary: UIColor  {
        return UIColor(named: "primary")!
    }
    
    static var secondary: UIColor  {
        return UIColor(named: "secondary")!
    }
    
    static var highlights: UIColor  {
        return UIColor(named: "highlights")!
    }
}

//
//  ProfileButtonStyle.swift
//  Evite
//
//  Created by Will morris on 9/20/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct ProfileButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .border(Color.gray, width: 0.5)
    }
}

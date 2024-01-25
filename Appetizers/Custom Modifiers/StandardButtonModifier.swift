//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Ali Tamoor on 25/01/2024.
//

import Foundation
import SwiftUI

struct StandardButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .bold()
            .tint(Color.primaryBrand)
            .controlSize(.regular)
            .foregroundStyle(Color(.systemBackground))
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonModifier())
    }
}

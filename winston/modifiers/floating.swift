//
//  floating.swift
//  winston
//
//  Created by Igor Marcossi on 11/07/23.
//

import Foundation
import SwiftUI


extension View {
    func floating() -> some View {
        self.background(Capsule(style: .continuous).fill(.ultraThinMaterial).shadow(radius: 8))
            .overlay(Capsule(style: .continuous).stroke(Color.white.opacity(0.05), lineWidth: 0.5).padding(.all, 0.5))
            
    }
}

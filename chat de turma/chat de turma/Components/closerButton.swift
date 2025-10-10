//
//  closerButton.swift
//  chat de turma
//
//  Created by user on 09/10/25.
//

import SwiftUI

struct CloserButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(
            action: {
                dismiss()
            },
            label: {
                Circle()
                    .frame(width: 32, height: 32)
                    .padding()
                    .overlay {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    .foregroundStyle(.red.opacity(0.8))
            }
        )
    }
}

#Preview {
    CloserButton()
}

//
//  ContentView.swift
//  task7
//
//  Created by mi11ion on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Button {
                    withAnimation(.spring) { isExpanded.toggle() }
                } label: {
                    RoundedRectangle(cornerRadius: isExpanded ? 20 : 15)
                        .fill(Color.blue)
                        .frame(
                            width: isExpanded ? 350 : 100,
                            height: isExpanded ? 450 : 60
                        )
                        .overlay(
                            Group {
                                if isExpanded { Color.clear }
                            }
                        )
                }
                .allowsHitTesting(!isExpanded)
                .position(
                    x: isExpanded ? proxy.size.width / 2 : proxy.size.width - 66,
                    y: isExpanded ? proxy.size.height / 2 : proxy.size.height - 50
                )

                Button {
                    withAnimation(.spring) { isExpanded.toggle() }
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "arrowshape.backward.fill")
                            .opacity(isExpanded ? 1 : 0)
                            .scaleEffect(isExpanded ? 1 : 0.01)

                        Text(isExpanded ? "Back" : "Open")
                            .contentTransition(.identity)
                    }
                    .foregroundColor(.white)
                    .font(.title3.bold())
                    .frame(width: isExpanded ? 350 : nil, alignment: .leading)
                }
                .allowsHitTesting(isExpanded)
                .position(
                    x: isExpanded ? proxy.size.width / 2 + 20 : proxy.size.width - 82,
                    y: isExpanded ? proxy.size.height / 2 - 190 : proxy.size.height - 50
                )
            }
        }
    }
}

#Preview {
    ContentView()
}

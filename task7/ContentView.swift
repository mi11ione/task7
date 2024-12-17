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
        ZStack {
            background
            title
        }
    }

    private var background: some View {
        Button {
            withAnimation(.spring) { isExpanded.toggle() }
        } label: {
            RoundedRectangle(cornerRadius: isExpanded ? 20 : 15)
                .fill(Color.blue)
                .frame(
                    width: isExpanded ? 350 : 100,
                    height: isExpanded ? 450 : 60
                )
        }
        .allowsHitTesting(!isExpanded)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: isExpanded ? .center : .bottomTrailing)
        .padding()
    }

    private var title: some View {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: isExpanded ? .top : .bottomTrailing)
        .offset(
            x: isExpanded ? 20 : -42,
            y: isExpanded ? 186 : -35
        )
        .allowsHitTesting(isExpanded)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  CardFlip
//
//  Created by 渡邊魁優 on 2024/05/03.
//

import SwiftUI

struct FripCard: View {
    @State private var progress: CGFloat = 0
    @State private var time = 0.0
    var body: some View {
        VStack {
            front(size: CGSize(width: 300, height: 200))
                .shadow(radius: 5, x: 0, y: 5)
                .overlay {
                    if time < -0.5 {
                        back(size: CGSize(width: 300, height: 200))
                            .scaleEffect(x: -1)
                            .transition(.identity)
                    }
                }
                .rotation3DEffect(
                    .init(degrees: progress),
                    //回転する方向設定
                    axis: (x: 0, y: 1, z: 0),
                    perspective: 0.5
                )
            Button(action: {
                frip()
            }, label: {
                Text("Frip")
            })
            .padding(.top)
        }
    }
    @ViewBuilder func front(size: CGSize) -> some View {
        Rectangle()
            .frame(width: size.width/2, height: size.height/2)
            .foregroundStyle(Color.white)
            .overlay {
                Text("Front")
            }
    }
    @ViewBuilder private func back(size: CGSize) -> some View {
        Rectangle()
            .frame(width: size.width/2, height: size.height/2)
            .foregroundStyle(Color.white)
            .overlay {
                Text("Back")
            }
    }
    private func frip() {
        withAnimation(.linear(duration: 0.2)) {
            time = abs(time) - 1
            progress = abs(progress) - 180
        }
    }
}

#Preview {
    FripCard()
}

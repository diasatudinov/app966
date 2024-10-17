//
//  LoaderView.swift
//  app966
//
//  Created by Dias Atudinov on 17.10.2024.
//

import SwiftUI

struct LoaderView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true

    var body: some View {
        if isLoadingView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Image("logo966")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 40)
                        
                        
                    
                    Spacer()
                    Spacer()
                    ZStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .primaryRed))
                            .scaleEffect(x: 1.7, y: 1.7, anchor: .center)
                            
                            
                    }
                    .foregroundColor(.black)
                    .padding(14)
                    .padding(.bottom, 60)
                }
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                
            }
            
        } else {
            if true {
                ReOnboardingUIView()
            } else {
                UsOnboardingUIView()
            }
            
        }
    }
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                isLoadingView.toggle()
            }
        }
    }
}


#Preview {
    LoaderView()
}

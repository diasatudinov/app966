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
    @State var returnBool = false
    let urlString = "https://podlaorlf.space/SfsjjbRQ"
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
                        .frame(width: UIScreen.main.bounds.width - 100)
                        
                        
                    
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
                    checkURLAndDecide()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                
            }
            
        } else {
            if isWithinTwoDays() {
                ReOnboardingUIView()
                
            } else if getAccess() == false {
                if returnBool {
                    ReOnboardingUIView()
                } else {
                    UsOnboardingUIView()
                }
            } else {
                ReOnboardingUIView()
            }
            
        }
    }
    
    func checkURLAndDecide() {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let urlResponse = response?.url?.absoluteString {
                
                if urlResponse.contains("google.") {
                    returnBool = urlResponse.contains("google.")
                } else {
                    returnBool = urlResponse.contains("google.")
                }
            }
        }.resume()
    }
    
    private func getAccess () -> Bool {
        let deviceData = DeviceInfo.collectData()
        
        UIDevice.current.isBatteryMonitoringEnabled = true
        guard !deviceData.isCharging else { return true }
        guard deviceData.batteryLevel < 1 && deviceData.batteryLevel > 0 else { return true }
        guard !deviceData.isVPNActive else { return true }
        return false
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
    
    func isWithinTwoDays() -> Bool {
        var dateComponents = DateComponents()
        dateComponents.year = 2024
        dateComponents.month = 11
        dateComponents.day = 4
        dateComponents.hour = 18
        
        if let today = Calendar.current.date(from: dateComponents) {
          
            if let twoDaysFromNow = Calendar.current.date(byAdding: .day, value: 2, to: today) {
               
                return Date() <= twoDaysFromNow
            }
        }
        return false
    }
}


#Preview {
    LoaderView()
}

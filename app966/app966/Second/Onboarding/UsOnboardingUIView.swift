//
//  UsOnboardingUIView.swift
//  app966
//
//  Created by Dias Atudinov on 17.10.2024.
//

import SwiftUI
import StoreKit


struct UsOnboardingUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true
    @State private var isNotificationView: Bool = true
    @State private var pageNum: Int = 1
    @AppStorage("onboardingShowed") var onboardingShowed: Bool = false
    
    var body: some View {
        if !onboardingShowed {
            if pageNum < 3 {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        Spacer()
                        switch pageNum {
                        case 1:
                            VStack {
                                Image("firstScreen966")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width)
                                    
                            }
                        case 2: Image("ratings966")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width)
                            
                        default:
                            Image("notifications926")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width)
                        }
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.secondBg)
                            VStack(spacing: 0) {
                                switch pageNum {
                                case 1:
                                    VStack(spacing: 12) {
                                        Text("Start now and earn more")
                                            .font(.system(size: 28, weight: .bold))
                                            .multilineTextAlignment(.center)
                                        Text("A proven way to make easy money")
                                            .font(.system(size: 15))
                                            .multilineTextAlignment(.center)
                                            .opacity(0.7)
                                    }.frame(height: 116).padding(.horizontal, 30).foregroundColor(.white).padding(.bottom, 30)
                                    
                                case 2:
                                    VStack(spacing: 12) {
                                        Text("Rate our app in the \nAppStore")
                                            .font(.system(size: 28, weight: .bold))
                                            .multilineTextAlignment(.center)
                                        Text("Help make the app even better")
                                            .font(.system(size: 15))
                                            .multilineTextAlignment(.center)
                                            .opacity(0.7)
                                    }.frame(height: 116).padding(.horizontal, 30).foregroundColor(.white).padding(.bottom, 30)
                                        .onAppear{
                                            rateApp()
                                        }
                                default:
                                    Text("Don’t miss anything")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                        .padding(.bottom, 10)
                                    Text("Don’t miss the most userful information")
                                        .foregroundColor(.white).opacity(0.7)
                                    
                                }
                                Spacer()
                                
                                
                                
                                
                                HStack {
                                    Button {
                                        if pageNum < 3 {
                                            withAnimation {
                                                pageNum += 1
                                            }
                                        } else {
                                        }
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(height: 52)
                                                .foregroundColor(.primaryRed)
                                                .cornerRadius(10)
                                                
                                            Text("Next")
                                                .foregroundColor(Color.black)
                                                .font(.system(size: 17, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                        }
                                    }
                                    
                                }.padding(.horizontal).padding(.bottom, 12)
                                
                                HStack(spacing: 8) {
                                    Circle()
                                        .fill(pageNum == 1 ? Color.primaryRed : Color.white.opacity(0.12))
                                        .frame(width: 8, height: 8)
                                        .cornerRadius(19)
                                    
                                    Circle()
                                        .fill(pageNum == 2 ? Color.primaryRed : Color.white.opacity(0.12))
                                        .frame(width: 8, height: 8)
                                        .cornerRadius(19)
                                    
                                }
                                .padding(8).padding(.horizontal, 4)
                                .background(Color.clear)
                                .cornerRadius(50)
                            }.padding(.top, 24).padding(.bottom)
                        }.frame(height: UIScreen.main.bounds.height * 0.36)
                    }.edgesIgnoringSafeArea(.bottom)
                    
                    
                }
            } else {
                if isNotificationView {
                    ZStack {
                        Color.black
                            .edgesIgnoringSafeArea(.all)
                        
                       
                        VStack(spacing: 0) {
                            Spacer()
                            HStack {
                                Spacer()
                                Button {
                                    isNotificationView = false
                                } label: {
                                    ZStack {
                                        Circle()
                                            .frame(height: 30)
                                            .foregroundColor(.white.opacity(0.12))
                                        Image(systemName: "xmark")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                    }
                                }
                            }.padding(.horizontal)
                            Image("notifications966")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width)
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.secondBg)
                               
                                VStack(spacing: 0) {
                                    VStack(spacing: 12) {
                                        Text("Don’t miss anything")
                                            .font(.system(size: 34, weight: .bold))
                                            .multilineTextAlignment(.center)
                                        Text("Don’t miss the most userful information")
                                            .font(.system(size: 15, weight: .regular))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .opacity(0.7)
                                    }.frame(height: 100).padding(.bottom, 50).padding(.horizontal, 30).foregroundColor(.white)
                                    Spacer()
                                    HStack {
                                        Button {
                                            isNotificationView = false
                                            onboardingShowed = true
                                        } label: {
                                            ZStack {
                                                Rectangle()
                                                    .frame(height: 52)
                                                    .foregroundColor(.primaryRed)
                                                    .cornerRadius(10)
                                                    
                                                Text("Enable Notification")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 17, weight: .regular))
                                                    .frame(maxWidth: .infinity)
                                            }
                                        }
                                        
                                            
                                        
                                    }.padding(.horizontal)
                                    
                                    HStack(spacing: 8) {
                                        Circle()
                                            .fill(Color.clear)
                                            .frame(width: 8, height: 8)
                                            .cornerRadius(19)
                                        
                                        Circle()
                                            .fill(Color.clear)
                                            .frame(width: 8, height: 8)
                                            .cornerRadius(19)
                                        
                                        
                                    }
                                    .padding(8).padding(.horizontal, 4)
                                    .background(Color.clear)
                                    .cornerRadius(50)
                                }.padding(.top, 24).padding(.bottom)
                                
                            }.frame(height: UIScreen.main.bounds.height * 0.36)
                        }.edgesIgnoringSafeArea(.bottom)
                        
                        
                    }
                    
                } else {
                    //WebUIView()
                }
            }
        } else {
            // WebUIView()
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
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
}

#Preview {
    UsOnboardingUIView()
}

//
//  ReOnboardingUIView.swift
//  app966
//
//  Created by Dias Atudinov on 17.10.2024.
//

import SwiftUI

struct ReOnboardingUIView: View {
    @State private var pageNum: Int = 1
    @State private var showSheet = false
    @AppStorage("signedUP") var signedUP: Bool = false
    
    var body: some View {
        if !signedUP {
            ZStack {
                Color.black
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    
                    switch pageNum {
                    case 1: Image("app966Screen1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .padding(.top, 35)
                    case 2: Image("app966Screen2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .padding(.top, 35)
                    
                    default:
                        Image("appScreen3")
                            .resizable()
                            .frame(height: 549)
                            .ignoresSafeArea()
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.secondBg)
                        
                        VStack {
                            switch pageNum {
                            case 1:
                                VStack(spacing: 12) {
                                    Text("Track Your Best Waves")
                                        .font(.system(size: 28, weight: .bold))
                                        .multilineTextAlignment(.center)
                                    Text("Record your top surf stats and set personal goals to ride even bigger waves.")
                                        .font(.system(size: 15))
                                        .multilineTextAlignment(.center)
                                        .opacity(0.7)
                                }.frame(height: 120).padding(.horizontal, 30).foregroundColor(.white).padding(.bottom, 30)
                            case 2:
                                VStack(spacing: 12) {
                                    Text("Organize Your Surf \nSessions")
                                        .font(.system(size: 28, weight: .bold))
                                        .multilineTextAlignment(.center)
                                    Text("Plan your trainings and competitions, and keep a detailed log of each surf session.")
                                        .font(.system(size: 15))
                                        .multilineTextAlignment(.center)
                                        .opacity(0.7)
                                }.frame(height: 120).padding(.horizontal, 30).foregroundColor(.white).padding(.bottom, 30)
                            
                            default:
                                Text("Save information about \nyour favorite routes")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .frame(height: 70)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 10)
                                
                            }
                            Spacer()
                            HStack {
                                Button {
                                    if pageNum < 2 {
                                        withAnimation {
                                            pageNum += 1
                                        }
                                    } else {
                                        signedUP = true
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
                                
                                
                            }.padding(.horizontal)
                            
                           
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
                            
                        }.padding(.bottom).padding(.top, 24)
                        
                    }
                    
                    
                }.edgesIgnoringSafeArea(.bottom)
            }
            
        } else {
            
          TabView()
        }
    }
}

#Preview {
    ReOnboardingUIView()
}

//
//  HomeUIView.swift
//  app966
//
//  Created by Dias Atudinov on 17.10.2024.
//

import SwiftUI

struct HomeUIView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading,spacing: 0) {
                HStack {
                    Text("Home")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        HStack {
                            Text("Lifts in a year")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            
                            NavigationLink {
                                EditUIView(viewModel: viewModel, editState: .lift)
                            } label: {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.white.opacity(0.3))
                                        .frame(width: 28)
                                    
                                    Image(systemName: "square.and.pencil")
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundColor(.primaryRed)
                                }
                            }
                        }.padding(.bottom, 10)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.secondaryRed)
                                .cornerRadius(20)
                            
                            ProgressCircle(progress: viewModel.progress)
                                .padding(35)
                            
                            VStack {
                                Text("Altitude record (Km)")
                                    .font(.system(size: 13, weight: .regular))
                                    .foregroundColor(.white.opacity(0.5))
                                Text("\(String(format: "%.1f %",viewModel.home.lifts))")
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundColor(.white)
                                Text("/\(String(format: "%.1f %",viewModel.home.goalLifts))")
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                        }.frame(height: 310).padding(.bottom, 25)
                        
                        HStack {
                            Text("Best result")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            
                            NavigationLink {
                                EditUIView(viewModel: viewModel, editState: .result)
                            } label: {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.white.opacity(0.3))
                                        .frame(width: 28)
                                    
                                    Image(systemName: "square.and.pencil")
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundColor(.primaryRed)
                                }
                            }
                        }.padding(.bottom, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Cell(text: "Height (km)", value: $viewModel.home.resultHeight, width: 161)
                                Cell(text: "Time", value: $viewModel.home.resultTime, width: 161)
                                Cell(text: "Average speed (km/h)", value: $viewModel.home.resultAvgSpeed, width: 161)
                            }.padding(.horizontal)
                        }.padding(.horizontal, -16).padding(.bottom, 25)
                        
                        HStack {
                            Text("Goals")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            
                            NavigationLink {
                                EditUIView(viewModel: viewModel, editState: .goal)
                            } label: {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.white.opacity(0.3))
                                        .frame(width: 28)
                                    
                                    Image(systemName: "square.and.pencil")
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundColor(.primaryRed)
                                }
                            }
                        }.padding(.bottom, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Cell(text: "Time goal", value: $viewModel.home.goalTime, width: 175)
                                Cell(text: "Height (km)", value: $viewModel.home.goalHeight, width: 175)
                            }.padding(.horizontal)
                        }.padding(.horizontal, -16).padding(.bottom, 25)
                        
                        HStack {
                            Text("Setting")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            
                            ZStack {
                                Circle()
                                    .foregroundColor(.white.opacity(0.3))
                                    .frame(width: 28)
                                
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(.primaryRed)
                            }
                        }.padding(.bottom, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Button {
                                    viewModel.rateApp()
                                } label: {
                                    ZStack {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 0) {
                                                Text("Rate \nApp")
                                                    .font(.system(size: 16, weight: .semibold))
                                                    .foregroundColor(.white)
                                            }
                                            Spacer()
                                        }.padding()
                                    }.frame(width: 114).background(Color.secondaryRed).cornerRadius(20)
                                }
                                
                                Button {
                                    viewModel.shareApp()
                                } label: {
                                    ZStack {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 0) {
                                                Text("Share \nApp")
                                                    .font(.system(size: 16, weight: .semibold))
                                                    .foregroundColor(.white)
                                            }
                                            Spacer()
                                        }.padding()
                                    }.frame(width: 114).background(Color.secondaryRed).cornerRadius(20)
                                }
                                
                                Button {
                                    viewModel.openUsagePolicy()
                                } label: {
                                    ZStack {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 0) {
                                                Text("Usage \nPolicy")
                                                    .font(.system(size: 16, weight: .semibold))
                                                    .foregroundColor(.white)
                                            }
                                            Spacer()
                                        }.padding()
                                    }.frame(width: 114).background(Color.secondaryRed).cornerRadius(20)
                                }
                            }.padding(.horizontal)
                        }.padding(.horizontal, -16).padding(.bottom, 25)
                        
                    }.padding(.horizontal).padding(.top, 20).padding(.bottom, 20)
                }
            }.padding(.top, 32)
        }.padding(.bottom, 20)
    }
    
//    private var cell: some View {
//        ZStack {
//            
//        }
//    }
}

#Preview {
    HomeUIView(viewModel: HomeViewModel())
}

struct Cell: View {
    @State var text: String
    @Binding var value: String
    var width: Double
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(text)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.bottom, 25)
                    Text(value)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                }
                Spacer()
            }.padding()
        }.frame(width: width).background(Color.secondaryRed).cornerRadius(20)
    }
}
struct ProgressCircle: View {
    var progress: Double
    
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(lineWidth: 8)
                .opacity(0.3)
                .foregroundColor(Color.white.opacity(0.5))
            
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0))) // от 0 до прогресса
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .foregroundColor(.primaryRed) // Цвет завершённой части
                .rotationEffect(Angle(degrees: 270)) // Чтобы начало круга было сверху
                .animation(.linear, value: progress)
            
            
        }
    }
    
    
}

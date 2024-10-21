//
//  TabView.swift
//  app966
//
//  Created by Dias Atudinov on 17.10.2024.
//

import SwiftUI

struct TabView: View {
    @State var selectedTab = 0
    private let tabs = ["Home", "Profile", "Settings"]
    
    @StateObject var homeVM = HomeViewModel()
    var body: some View {
        
        ZStack {
            
            switch selectedTab {
            case 0:
                HomeUIView(viewModel: homeVM)
                
                
            case 1:
                Text("Calendar")
                
            case 2:
                Text("Contests")
                
            default:
                Text("default")
            }
            VStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(Color.secondBg)
                        .frame(height: 84)
                        .cornerRadius(20)
                        .shadow(radius: 4)
                    
                    HStack(spacing: 100) {
                        ForEach(0..<tabs.count) { index in
                            Button(action: {
                                selectedTab = index
                            }) {
                                
                                ZStack {
                                    VStack {
                                        Image(systemName: icon(for: index))
                                            .font(.system(size: 20, weight: .semibold))
                                            .padding(.bottom, 2)
                                    }.foregroundColor(selectedTab == index ? Color.secondaryRed : Color.gray.opacity(0.5))
                                }
                            }
                            
                        }
                    }.padding(.bottom, 34)
                    
                    
                }.padding(.bottom, -14)
                
            }.ignoresSafeArea()
            
        }
    }
    
    private func icon(for index: Int) -> String {
        switch index {
        case 0: return "house.fill"
        case 1: return "calendar"
        case 2: return "gauge.with.dots.needle.bottom.50percent"
        default: return ""
        }
    }
    
    private func text(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Procedures"
        case 2: return "Settings"
        default: return ""
        }
    }
}


#Preview {
    TabView()
}

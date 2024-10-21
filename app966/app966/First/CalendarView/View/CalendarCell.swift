//
//  CalendarCell.swift
//  app966
//
//  Created by Dias Atudinov on 21.10.2024.
//

import SwiftUI

struct CalendarCell: View {
    @State var calendar: Calendar
    var onDelete: () -> Void
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.primaryRed)
            VStack {
                HStack {
                    Spacer()
                    Image("cellImage")
                        .resizable()
                        .scaledToFit()
                }
            }
            
            VStack(spacing: 0) {
                VStack(spacing: 10) {
                    HStack {
                        Text(calendar.date)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        Button {
                            onDelete()
                        } label: {
                            Image(systemName: "trash.fill")
                        }
                    }.foregroundColor(.white)
                    HStack {
                        Image(systemName: "beach.umbrella")
                            .font(.system(size: 15, weight: .regular))
                        Text(calendar.location)
                            .font(.system(size: 17, weight: .semibold))
                            .opacity(0.7)
                        Spacer()
                    }.foregroundColor(.white)
                    
                    HStack {
                        Image(systemName: "surfboard")
                            .font(.system(size: 15, weight: .regular))
                        Text(calendar.height)
                            .font(.system(size: 17, weight: .semibold))
                            .opacity(0.7)
                        Spacer()
                    }.foregroundColor(.white)
                }.padding(.bottom, 25)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Equipment")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.white.opacity(0.7))
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(calendar.equipments, id: \.self) { equipment in
                            
                                Text(equipment)
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.white.opacity(0.7))
                                    .padding(6).padding(.horizontal, 4)
                                    .background(Color.white.opacity(0.3))
                                    .cornerRadius(12)
                            }
                        }.padding(.horizontal)
                    }.padding(.horizontal, -16)
                }
                Spacer()
                
            }.padding()
        }.frame(height: 203).cornerRadius(20)
    }
}

#Preview {
    CalendarCell(calendar: Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]), onDelete: {})
}

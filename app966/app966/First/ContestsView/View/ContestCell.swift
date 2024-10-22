//
//  ContestCell.swift
//  app966
//
//  Created by Dias Atudinov on 22.10.2024.
//

import SwiftUI

struct ContestCell: View {
    @State var contest: Contest
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
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(contest.date)
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
                        Text(contest.location)
                            .font(.system(size: 17, weight: .semibold))
                            .opacity(0.7)
                        Spacer()
                    }.foregroundColor(.white)
                    
                    HStack {
                        Image(systemName: "surfboard")
                            .font(.system(size: 15, weight: .regular))
                        Text(contest.height)
                            .font(.system(size: 17, weight: .semibold))
                            .opacity(0.7)
                        Spacer()
                    }.foregroundColor(.white)
                }.padding(.bottom, 25)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(contest.note)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.white.opacity(0.7))
                        Spacer()
                    }
                    
                    
                }
                Spacer()
                
            }.padding()
        }.frame(height: 203).cornerRadius(20)
    }
}

#Preview {
    ContestCell(contest: Contest(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", note: "This season, broadcasts were organized for fans at almost every competition location. The upcoming races on Elbrus can be watched live on March 31 and April 1 in the official VKontakte groups of the Russian Alpine Ski Federation and Kavkaz.RF."), onDelete: {})
}

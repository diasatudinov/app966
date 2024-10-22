//
//  ContestsUIView.swift
//  app966
//
//  Created by Dias Atudinov on 22.10.2024.
//

import SwiftUI

struct ContestsUIView: View {
    @ObservedObject var viewModel: ContestsViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .center,spacing: 0) {
                HStack {
                    Text("Contests")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    
                    NavigationLink {
                        NewContestsUIView(viewModel: viewModel)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.primaryRed)
                                .cornerRadius(15)
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }.padding(.horizontal)
                
                if viewModel.contests.isEmpty {
                    Spacer()
                    VStack(spacing: 8) {
                        Image(systemName: "gauge.with.dots.needle.bottom.50percent")
                            .font(.system(size: 50, weight: .medium))
                            .foregroundColor(.secondaryRed)
                        Text("Empty")
                            .font(.system(size: 28, weight: .bold))
                        Text("Nothing has been added to \nyour calendar yet")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20, weight: .semibold))
                            .opacity(0.5)
                    }.foregroundColor(.white)
                    Spacer()
                    Spacer()
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ForEach(viewModel.contests, id: \.self) { contest in
                                ContestCell(contest: contest, onDelete: {
                                    viewModel.deleteContest(contest)
                                })
                                
                            }
                        }.padding(.horizontal).padding(.top, 20).padding(.bottom, 20)
                    }
                }
            }.padding(.top, 32)
        }.padding(.bottom, 20)
    }
}

#Preview {
    ContestsUIView(viewModel: ContestsViewModel())
}
